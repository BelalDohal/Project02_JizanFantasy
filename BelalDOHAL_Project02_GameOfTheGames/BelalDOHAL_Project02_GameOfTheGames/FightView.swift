import UIKit

class FightView: UIViewController {
    @IBOutlet weak var diceLable: UILabel!
    //----------Player Things//
    @IBOutlet weak var playerUIImage: UIImageView!
    @IBOutlet weak var playerNameLable: UILabel!
    var playerNL = ""
    var pImage = 0
    @IBOutlet weak var specialCLable: UILabel!
    var specialCText = ""
    var sCValue = 0
    var sCBonusWD = 0
    var sCBonusPD = 0
    var sCBonusLP = 0
    @IBOutlet weak var weaponDLable: UILabel!
    var weaponDValue = 0
    @IBOutlet weak var poweDLable: UILabel!
    var powerDValue = 0
    @IBOutlet weak var defenseLable: UILabel!
    var defenseValue = 0
    @IBOutlet weak var lifePLable: UILabel!
    var lifePValue = 0
    //Dice Thing//
    @IBOutlet weak var rulleTheDice: UIButton!
    //Turn Text Things//
    //----------Boss Things//
    @IBOutlet weak var bossUIImage: UIImageView!
    var bossImage = 0
    @IBOutlet weak var bossLable: UILabel!
    var bossName = ""
    @IBOutlet weak var bossLP: UILabel!
    var bStateLP = 0
    @IBOutlet weak var bossDEF: UILabel!
    var bStateDEF = 0
    @IBOutlet weak var bossPD: UILabel!
    var bStatePD = 0
    @IBOutlet weak var bossWD: UILabel!
    var bStateWD = 0
    @IBOutlet weak var bossSC: UILabel!
    var btextSC = ""
    var bStateSCD = 0
    var bStateSCWD = 0
    var bStateSCPD = 0
    var bStateSCLP = 0
    //Override//
    override func viewDidLoad() {
        super.viewDidLoad()
        diceLable.text = "Start The Game"
        rulleTheDice.layer.cornerRadius = 20
        if pImage == 1 {
            playerUIImage.image = UIImage(named: "Warrior")
        }else if pImage == 2 {
            playerUIImage.image = UIImage(named: "Mage")
        }else {
            playerUIImage.image = UIImage(named: "Rouge")
        }
        playerNameLable.text = playerNL
        specialCLable.text = specialCText
        weaponDLable.text = "\(weaponDValue)"
        poweDLable.text = "\(powerDValue)"
        defenseLable.text = "\(defenseValue)"
        lifePLable.text = "\(lifePValue)"
        //Boss//
        if bossImage == 1 {
            bossUIImage.image = UIImage(named: "Ravana")
            bossLable.text = bossName
            bossLP.text = "\(bStateLP)"
            bossPD.text = "\(bStatePD)"
            bossSC.text = btextSC
            bossWD.text = "\(bStateWD)"
            bossDEF.text = "\(bStateDEF)"
        }else {
            bossUIImage.image = UIImage(named: "Dragon")
            bossLable.text = bossName
            bossLP.text = "\(bStateLP)"
            bossPD.text = "\(bStatePD)"
            bossSC.text = btextSC
            bossWD.text = "\(bStateWD)"
            bossDEF.text = "\(bStateDEF)"
        }
    }
    //Play The Game//
    var turnNumber = 0
    var turnHow = true
    @IBAction func rulleTheDice(_ sender: Any) {
        let rD = Int.random(in: 1...20)
        diceLable.text = "\(rD)"
        if turnHow == true {
            switch rD {
            case 1...9:
                turnHow = false
                let wDCal = powerDValue - bStateDEF
                if wDCal <= 0 {
                    bStateLP -= 0
                }else {
                    bStateLP -= wDCal
                }
                bossLP.text = "\(bStateLP)"
                lifePLable.text = "\(lifePValue)"
            case 10...19:
                turnHow = false
                let pDCal = weaponDValue - bStateDEF
                if pDCal <= 0 {
                    bStateLP -= 0
                }else {
                    bStateLP -= pDCal
                }
                bossLP.text = "\(bStateLP)"
                lifePLable.text = "\(lifePValue)"
            case 20:
                turnHow = false
                let sCDcal = sCValue - bStateDEF
                if sCDcal <= 0 {
                    bStateLP -= 0
                }else {
                    bStateLP -= sCDcal
                }
                lifePValue += sCBonusLP
                powerDValue += sCBonusPD
                weaponDValue += sCBonusWD
                poweDLable.text = "\(powerDValue)"
                weaponDLable.text = "\(weaponDValue)"
                bossLP.text = "\(bStateLP)"
                lifePLable.text = "\(lifePValue)"
            default: print("ERROR")
            }
        }else {
            switch rD {
            case 1...9:
                turnHow = true
                turnNumber += 1
                let bPDCal = bStatePD - defenseValue
                if bPDCal <= 0 {
                    lifePValue -= 0
                }else {
                    lifePValue -= bPDCal
                }
                bossLP.text = "\(bStateLP)"
                lifePLable.text = "\(lifePValue)"
            case 10...19:
                turnHow = true
                turnNumber += 1
                let bWDCal = bStateWD - defenseValue
                if bWDCal <= 0 {
                    lifePValue -= 0
                }else {
                    lifePValue -= bWDCal
                }
                bossLP.text = "\(bStateLP)"
                lifePLable.text = "\(lifePValue)"
            case 20:
                turnHow = true
                turnNumber += 1
                let bSCDcal = bStateSCD - defenseValue
                if bSCDcal <= 0 {
                    lifePValue -= 0
                }else {
                    lifePValue -= bSCDcal
                }
                //lifePValue -= (bStateSCD - defenseValue)
                bStateLP += bStateSCLP
                bStatePD += bStateSCPD
                bStateWD += bStateSCWD
                bossPD.text = "\(bStatePD)"
                bossWD.text = "\(bStateWD)"
                bossLP.text = "\(bStateLP)"
                lifePLable.text = "\(lifePValue)"
            default: print("ERROR")
            }
        }
    }
}

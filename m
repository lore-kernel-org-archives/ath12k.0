Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477E9C83F25
	for <ath12k@archiver.kernel.org>; Tue, 22 Jul 2025 00:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:From:Date:Reply-To:To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pXMPUFnpCquIlV0HliwZfZ63MVQeJTZVblVvXCA9YGU=; b=2si1DZ+XA+6168dg/8Tm7Y6Cgr
	GgFothrDKbaEfBrGfiImYeokYK31ocvpQDPuFFjQtINdFnsUHVUbuB3cJKhptw62FayfrK+kmwkU6
	xI3mfDhG0njFyBs4FuXJvR1qijC5JF2ZOFky4PMF2NBNRfngFcYHDizZFY17bG80cT4DgIbBjExBO
	mN0C2zpoLq4leI9iybRsuA9Y3wEjhMprX6uC2sWmSnvcRvZWZ0X2d7miI20vwlqjCAeQtY12Cf7ZN
	3c3iPynquWXzdjeQYWbY+KZMoYMinaHiwcCP9nidAKGyjj7Lxe3qrhtLMQQVAcYJ5wEaBPnclu3O0
	JxPVl8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue0Yl-00000000w00-3rdj;
	Tue, 22 Jul 2025 00:08:43 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue0Yi-00000000vzg-2MM3
	for ath12k@lists.infradead.org;
	Tue, 22 Jul 2025 00:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753142920; x=1784678920;
  h=date:from:cc:subject:message-id:mime-version;
  bh=UBf8Fuz2a5YYUXW0Ac29BBpwFq1J7kp+RtxDnxJZco4=;
  b=GuhsL4M6zHO3hQEKBJ8kgMbQKcAJ6oMYnHqxZXx+b34WVXiC7TWo8mgl
   Yz0hh41i2jYzjviZDTsioc+c5oR+v3zymxK16mCNNq7LhKz/Hz6DrTtvi
   MclP4RKG4+HPKPBm93QKCBvN/hwlXW8JBe5Kleen73trVHV5eIAMOLlda
   mDKWIIxfAJxpICcAH21iD4strMCty4pTwPTDfcb4eWNC3IKrYtc+hL61F
   oRY2bqxdwxcLYza+orYqrZFJ0nFW9p/ErZLf1IzZobQj0Mtg8TNsQooAg
   2aR8vvQ0MOrym2jT2PsoT3jN4m0b3wjsmJg9JaTGqYZw0vcTn3EUXCX2L
   g==;
X-CSE-ConnectionGUID: VjP65m8eR+qbFn1G/V2DgA==
X-CSE-MsgGUID: EzMCScDZRfecXwvmibbjPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55527549"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="55527549"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 17:08:39 -0700
X-CSE-ConnectionGUID: o6UPAVWnQAO71bvOSvdlhQ==
X-CSE-MsgGUID: XANzN2SGRIexv2VGyg3w5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="189932853"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jul 2025 17:08:37 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue0Yd-000HGr-0E;
	Tue, 22 Jul 2025 00:08:35 +0000
Date: Tue, 22 Jul 2025 08:07:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org
Subject: [ath:master 5/7] drivers/net/phy/phy_device.c:3506:7: error: call to
 undeclared function 'phy_driver_is_genphy_10g'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202507220841.K9XCOI0c-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_170840_664901_99C2F202 
X-CRM114-Status: GOOD (  17.19  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
head:   e7387aea906012a38c96a5010071e4f7d3910e5c
commit: 0bc6b8212a169d54a3bc6615c61fc84ddb713715 [5/7] Merge branch 'ath-current'
config: s390-randconfig-001-20250722 (https://download.01.org/0day-ci/archive/20250722/202507220841.K9XCOI0c-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220841.K9XCOI0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220841.K9XCOI0c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/phy_device.c:3506:7: error: call to undeclared function 'phy_driver_is_genphy_10g'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3506 |             !phy_driver_is_genphy_10g(phydev))
         |              ^
   drivers/net/phy/phy_device.c:3506:7: note: did you mean 'phy_driver_is_genphy'?
   include/linux/phy.h:1316:20: note: 'phy_driver_is_genphy' declared here
    1316 | static inline bool phy_driver_is_genphy(struct phy_device *phydev)
         |                    ^
   drivers/net/phy/phy_device.c:3524:7: error: call to undeclared function 'phy_driver_is_genphy_10g'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3524 |             !phy_driver_is_genphy_10g(phydev))
         |              ^
   2 errors generated.


vim +/phy_driver_is_genphy_10g +3506 drivers/net/phy/phy_device.c

425775ed31a6fa Calvin Johnson        2021-06-11  3386  
b3df0da886ffdb Randy Dunlap          2007-03-06  3387  /**
b3df0da886ffdb Randy Dunlap          2007-03-06  3388   * phy_probe - probe and init a PHY device
b3df0da886ffdb Randy Dunlap          2007-03-06  3389   * @dev: device to probe and init
00db8189d984d6 Andy Fleming          2005-07-30  3390   *
83456576a42050 Wolfram Sang          2023-03-14  3391   * Take care of setting up the phy_device structure, set the state to READY.
00db8189d984d6 Andy Fleming          2005-07-30  3392   */
00db8189d984d6 Andy Fleming          2005-07-30  3393  static int phy_probe(struct device *dev)
00db8189d984d6 Andy Fleming          2005-07-30  3394  {
553fe92b26e152 Sergei Shtylyov       2014-01-05  3395  	struct phy_device *phydev = to_phy_device(dev);
e5a03bfd873c29 Andrew Lunn           2016-01-06  3396  	struct device_driver *drv = phydev->mdio.dev.driver;
553fe92b26e152 Sergei Shtylyov       2014-01-05  3397  	struct phy_driver *phydrv = to_phy_driver(drv);
00db8189d984d6 Andy Fleming          2005-07-30  3398  	int err = 0;
00db8189d984d6 Andy Fleming          2005-07-30  3399  
00db8189d984d6 Andy Fleming          2005-07-30  3400  	phydev->drv = phydrv;
00db8189d984d6 Andy Fleming          2005-07-30  3401  
2c7b49212a86f1 Florian Fainelli      2013-05-19  3402  	/* Disable the interrupt if the PHY doesn't support it
2c7b49212a86f1 Florian Fainelli      2013-05-19  3403  	 * but the interrupt is still a valid one
2c7b49212a86f1 Florian Fainelli      2013-05-19  3404  	 */
0d2e778e38e0dd Heiner Kallweit       2018-11-09  3405  	if (!phy_drv_supports_irq(phydrv) && phy_interrupt_is_valid(phydev))
00db8189d984d6 Andy Fleming          2005-07-30  3406  		phydev->irq = PHY_POLL;
00db8189d984d6 Andy Fleming          2005-07-30  3407  
4284b6a535a9aa Florian Fainelli      2013-05-23  3408  	if (phydrv->flags & PHY_IS_INTERNAL)
4284b6a535a9aa Florian Fainelli      2013-05-23  3409  		phydev->is_internal = true;
4284b6a535a9aa Florian Fainelli      2013-05-23  3410  
92ed2eb7f4b73e Andrew Lunn           2019-02-09  3411  	/* Deassert the reset signal */
92ed2eb7f4b73e Andrew Lunn           2019-02-09  3412  	phy_device_reset(phydev, 0);
92ed2eb7f4b73e Andrew Lunn           2019-02-09  3413  
1dba6995731e1c Bartosz Golaszewski   2020-06-26  3414  	if (phydev->drv->probe) {
92ed2eb7f4b73e Andrew Lunn           2019-02-09  3415  		err = phydev->drv->probe(phydev);
1dba6995731e1c Bartosz Golaszewski   2020-06-26  3416  		if (err)
92ed2eb7f4b73e Andrew Lunn           2019-02-09  3417  			goto out;
92ed2eb7f4b73e Andrew Lunn           2019-02-09  3418  	}
92ed2eb7f4b73e Andrew Lunn           2019-02-09  3419  
cc941e548bffc0 Russell King (Oracle  2023-08-11  3420) 	phy_disable_interrupts(phydev);
cc941e548bffc0 Russell King (Oracle  2023-08-11  3421) 
00db8189d984d6 Andy Fleming          2005-07-30  3422  	/* Start out supporting everything. Eventually,
00db8189d984d6 Andy Fleming          2005-07-30  3423  	 * a controller will attach, and may modify one
2f53e9047e79b6 Sergei Shtylyov       2014-01-05  3424  	 * or both of these values
2f53e9047e79b6 Sergei Shtylyov       2014-01-05  3425  	 */
c2a978c171a6d4 Andrew Lunn           2023-02-17  3426  	if (phydrv->features) {
3c1bcc8614db10 Andrew Lunn           2018-11-10  3427  		linkmode_copy(phydev->supported, phydrv->features);
c2a978c171a6d4 Andrew Lunn           2023-02-17  3428  		genphy_c45_read_eee_abilities(phydev);
c2a978c171a6d4 Andrew Lunn           2023-02-17  3429  	}
169d7a402dfae4 Wenpeng Liang         2021-06-16  3430  	else if (phydrv->get_features)
efbdfdc29bdd4d Andrew Lunn           2019-02-09  3431  		err = phydrv->get_features(phydev);
169d7a402dfae4 Wenpeng Liang         2021-06-16  3432  	else if (phydev->is_c45)
a1deab17b2e901 Heiner Kallweit       2019-04-03  3433  		err = genphy_c45_pma_read_abilities(phydev);
169d7a402dfae4 Wenpeng Liang         2021-06-16  3434  	else
a1deab17b2e901 Heiner Kallweit       2019-04-03  3435  		err = genphy_read_abilities(phydev);
a1deab17b2e901 Heiner Kallweit       2019-04-03  3436  
efbdfdc29bdd4d Andrew Lunn           2019-02-09  3437  	if (err)
efbdfdc29bdd4d Andrew Lunn           2019-02-09  3438  		goto out;
efbdfdc29bdd4d Andrew Lunn           2019-02-09  3439  
5e42574b022b26 Heiner Kallweit       2019-04-16  3440  	if (!linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
5e42574b022b26 Heiner Kallweit       2019-04-16  3441  			       phydev->supported))
5e42574b022b26 Heiner Kallweit       2019-04-16  3442  		phydev->autoneg = 0;
5e42574b022b26 Heiner Kallweit       2019-04-16  3443  
3b8b11f96616c2 Heiner Kallweit       2019-04-05  3444  	if (linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
3b8b11f96616c2 Heiner Kallweit       2019-04-05  3445  			      phydev->supported))
3b8b11f96616c2 Heiner Kallweit       2019-04-05  3446  		phydev->is_gigabit_capable = 1;
3b8b11f96616c2 Heiner Kallweit       2019-04-05  3447  	if (linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
3b8b11f96616c2 Heiner Kallweit       2019-04-05  3448  			      phydev->supported))
3b8b11f96616c2 Heiner Kallweit       2019-04-05  3449  		phydev->is_gigabit_capable = 1;
3b8b11f96616c2 Heiner Kallweit       2019-04-05  3450  
de906af1cf8d5f Sascha Hauer          2014-05-21  3451  	of_set_phy_supported(phydev);
22c0ef6b1475ae Heiner Kallweit       2019-05-01  3452  	phy_advertise_supported(phydev);
00db8189d984d6 Andy Fleming          2005-07-30  3453  
3eeca4e199cee2 Oleksij Rempel        2023-02-22  3454  	/* Get PHY default EEE advertising modes and handle them as potentially
3eeca4e199cee2 Oleksij Rempel        2023-02-22  3455  	 * safe initial configuration.
3eeca4e199cee2 Oleksij Rempel        2023-02-22  3456  	 */
3eeca4e199cee2 Oleksij Rempel        2023-02-22  3457  	err = genphy_c45_read_eee_adv(phydev, phydev->advertising_eee);
3eeca4e199cee2 Oleksij Rempel        2023-02-22  3458  	if (err)
8f9850dd8d23c1 Dan Carpenter         2023-02-27  3459  		goto out;
3eeca4e199cee2 Oleksij Rempel        2023-02-22  3460  
7f33fea6bb53d4 Heiner Kallweit       2025-02-16  3461  	/* Get the EEE modes we want to prohibit. */
7f33fea6bb53d4 Heiner Kallweit       2025-02-16  3462  	of_set_phy_eee_broken(phydev);
3eeca4e199cee2 Oleksij Rempel        2023-02-22  3463  
3eeca4e199cee2 Oleksij Rempel        2023-02-22  3464  	/* Some PHYs may advertise, by default, not support EEE modes. So,
7f33fea6bb53d4 Heiner Kallweit       2025-02-16  3465  	 * we need to clean them. In addition remove all disabled EEE modes.
3eeca4e199cee2 Oleksij Rempel        2023-02-22  3466  	 */
3eeca4e199cee2 Oleksij Rempel        2023-02-22  3467  	linkmode_and(phydev->advertising_eee, phydev->supported_eee,
3eeca4e199cee2 Oleksij Rempel        2023-02-22  3468  		     phydev->advertising_eee);
7f33fea6bb53d4 Heiner Kallweit       2025-02-16  3469  	linkmode_andnot(phydev->advertising_eee, phydev->advertising_eee,
7f33fea6bb53d4 Heiner Kallweit       2025-02-16  3470  			phydev->eee_disabled_modes);
3eeca4e199cee2 Oleksij Rempel        2023-02-22  3471  
7f33fea6bb53d4 Heiner Kallweit       2025-02-16  3472  	/* There is no "enabled" flag. If PHY is advertising, assume it is
7f33fea6bb53d4 Heiner Kallweit       2025-02-16  3473  	 * kind of enabled.
d853d145ea3e63 jbrunet               2016-11-28  3474  	 */
7f33fea6bb53d4 Heiner Kallweit       2025-02-16  3475  	phydev->eee_cfg.eee_enabled = !linkmode_empty(phydev->advertising_eee);
d853d145ea3e63 jbrunet               2016-11-28  3476  
20a4da20e0bd02 Oleksij Rempel        2024-10-04  3477  	/* Get master/slave strap overrides */
20a4da20e0bd02 Oleksij Rempel        2024-10-04  3478  	of_set_phy_timing_role(phydev);
20a4da20e0bd02 Oleksij Rempel        2024-10-04  3479  
529ed12752635b Timur Tabi            2016-12-07  3480  	/* The Pause Frame bits indicate that the PHY can support passing
529ed12752635b Timur Tabi            2016-12-07  3481  	 * pause frames. During autonegotiation, the PHYs will determine if
529ed12752635b Timur Tabi            2016-12-07  3482  	 * they should allow pause frames to pass.  The MAC driver should then
529ed12752635b Timur Tabi            2016-12-07  3483  	 * use that result to determine whether to enable flow control via
529ed12752635b Timur Tabi            2016-12-07  3484  	 * pause frames.
529ed12752635b Timur Tabi            2016-12-07  3485  	 *
529ed12752635b Timur Tabi            2016-12-07  3486  	 * Normally, PHY drivers should not set the Pause bits, and instead
529ed12752635b Timur Tabi            2016-12-07  3487  	 * allow phylib to do that.  However, there may be some situations
529ed12752635b Timur Tabi            2016-12-07  3488  	 * (e.g. hardware erratum) where the driver wants to set only one
529ed12752635b Timur Tabi            2016-12-07  3489  	 * of these bits.
529ed12752635b Timur Tabi            2016-12-07  3490  	 */
efbdfdc29bdd4d Andrew Lunn           2019-02-09  3491  	if (!test_bit(ETHTOOL_LINK_MODE_Pause_BIT, phydev->supported) &&
efbdfdc29bdd4d Andrew Lunn           2019-02-09  3492  	    !test_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, phydev->supported)) {
3c1bcc8614db10 Andrew Lunn           2018-11-10  3493  		linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT,
3c1bcc8614db10 Andrew Lunn           2018-11-10  3494  				 phydev->supported);
3c1bcc8614db10 Andrew Lunn           2018-11-10  3495  		linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT,
3c1bcc8614db10 Andrew Lunn           2018-11-10  3496  				 phydev->supported);
529ed12752635b Timur Tabi            2016-12-07  3497  	}
529ed12752635b Timur Tabi            2016-12-07  3498  
00db8189d984d6 Andy Fleming          2005-07-30  3499  	/* Set the state to READY by default */
00db8189d984d6 Andy Fleming          2005-07-30  3500  	phydev->state = PHY_READY;
00db8189d984d6 Andy Fleming          2005-07-30  3501  
01e5b728e9e43a Andrew Lunn           2023-04-17  3502  	/* Get the LEDs from the device tree, and instantiate standard
01e5b728e9e43a Andrew Lunn           2023-04-17  3503  	 * LEDs for them.
01e5b728e9e43a Andrew Lunn           2023-04-17  3504  	 */
f0f2b992d8185a Sean Anderson         2025-07-07  3505  	if (IS_ENABLED(CONFIG_PHYLIB_LEDS) && !phy_driver_is_genphy(phydev) &&
f0f2b992d8185a Sean Anderson         2025-07-07 @3506  	    !phy_driver_is_genphy_10g(phydev))
01e5b728e9e43a Andrew Lunn           2023-04-17  3507  		err = of_phy_leds(phydev);
01e5b728e9e43a Andrew Lunn           2023-04-17  3508  
92ed2eb7f4b73e Andrew Lunn           2019-02-09  3509  out:
f4b47a2e946395 Russell King (Oracle  2023-03-03  3510) 	/* Re-assert the reset signal on error */
1dba6995731e1c Bartosz Golaszewski   2020-06-26  3511  	if (err)
1dba6995731e1c Bartosz Golaszewski   2020-06-26  3512  		phy_device_reset(phydev, 1);
1dba6995731e1c Bartosz Golaszewski   2020-06-26  3513  
00db8189d984d6 Andy Fleming          2005-07-30  3514  	return err;
00db8189d984d6 Andy Fleming          2005-07-30  3515  }
00db8189d984d6 Andy Fleming          2005-07-30  3516  

:::::: The code at line 3506 was first introduced by commit
:::::: f0f2b992d8185a0366be951685e08643aae17d6d net: phy: Don't register LEDs for genphy

:::::: TO: Sean Anderson <sean.anderson@linux.dev>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556F9F34C62
	for <ath12k@archiver.kernel.org>; Mon, 13 Apr 2026 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=axp7tNpBNw3aQicWgliM1g5+tiQFHVw+0xRkGYUDKf4=; b=QM2QBD1MgiA8Ikj7GbLu3iRbJD
	A4pHPUbV6BfOyDaUW50ZNTvxLieF90rJapimGjhwN9CY2PLKwaZVdn2hCu41ReewkuMGRl5ESxCUC
	3GrJJjhf6gaYOSNVzoMAhzHsohRvYfGvqNWQcHQbVpoDS8B0gW877VK64YJGz/cux3qv9B9MUOajw
	wxbvZO4eYqHn01jE8WEAk/d/4Zfu+m81vR9p3vh66AWE7ZZSr3es5aJjSiax9gOn6Wt8yp72tFZgL
	IvtUXe2liWGIadvK0DhM9OFhG+qfv/oP/z6klZrt5yOxjEJXNQ/YDF7ZiC5l/TiOxqu5YpcmRRj+5
	H0WQziMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJO3-0000000Fz0z-0JRi;
	Mon, 13 Apr 2026 15:39:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJO0-0000000Fz0G-3CrQ
	for ath12k@lists.infradead.org;
	Mon, 13 Apr 2026 15:39:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DE7YNS117582
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 15:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=axp7tNpBNw3aQicWgliM1g5+tiQFHVw+0xR
	kGYUDKf4=; b=NnE3NY3nBoEYvIbAPn5ptA6I65H0TfAWclG2wxNonCqL01kOuO9
	c0H4heBRyVXGM2q3nEO+wpWBfGlF8vm4qAM9JIuGGZaecv3tJaWQ2Z6Rh8utREG7
	/iHV23VKZCIUUTOYlQ9stqyISziSZXF/lWJ95rTDiKnzNpiSgFLaHJwG3T5wsSMK
	l3C1qzoQACwNWiHewKE1BdAYY3g/2AKEZfJzbSaqtnI2HpwVu/F115P1MSdS8/Gk
	FsrDPyZ4hxbQ5CJL7SRFq89dqz7JtA3ugp5Fr86W5fXuWdD7LEPiRIkBXxckRCMR
	IiO/DcBE24n2fjkJelA8/ZjI2FHykAogmAA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkx436-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 15:39:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbaada0caso1160731a91.3
        for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776094778; x=1776699578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=axp7tNpBNw3aQicWgliM1g5+tiQFHVw+0xRkGYUDKf4=;
        b=TamC4tEaYB1Q4sSMPf3LvCDwnTc3GoOyLUNGQ5LCik/myxLyA6uxdPuHHonPwKX4cJ
         +Ca0hB/ZDt+wN2X+5bRHmiA0ezycvEAiiplfMFVbKDWRI0OFl7xITBopu0Ga1vc9yABR
         jgDiASdicoswFbzzKW2ZWtebWD5DozwqDKJgUoWRc+U2Jl0XM3+gu4ehb1WpqBLmuTIi
         HlV5slIMJuL1kWH6G7s1YUWSJbjJlgx/vxeZPgc+6LCZKo4KCuaGIw2Eg/5Lk894xHSX
         V32wVC46qQhewNW0cA+2YBeqCTpblsAuCB6yVUi223B6J1aeN0skb7mOwIIducR3XAjV
         0Fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776094778; x=1776699578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axp7tNpBNw3aQicWgliM1g5+tiQFHVw+0xRkGYUDKf4=;
        b=iNSi8t/MwGBHcvKX7H0+vHZpzWIIFm9b+Li5duhZ4Q5bBTAl+FIdnToltTXOFCNX/k
         0Fnjz7SBWf001mexDKDuM/GaYLVElAV+4rdLnj9ucosGsQbYgLWgixAVErB8U6Gmn5D8
         7QcTzKF3MQxxgkT1fIbj1rpwoHslGbnNCs43mR6V0voQaWCJi7MIMnnPdrUnvJIAr1gD
         7KaVSENlPETd00n2O1sAyzE6VE/GSUQRoQoDf3USX2GiA6B+t/pYNjoYWGMc7/92Gnou
         Nge8qnHGrKtpaf8oQQ89auAzsbv2YNSHksmwoBH0/j2/7UzjjIbM61Ux57eoJO0C435U
         8z8A==
X-Gm-Message-State: AOJu0YwHddawYfsBxGE+GiuhBkGFXCfEIEFR+dp8UE8fgJXShn26Higb
	0FlXuimrKZIfGX2uWEC/xEgUbGd54LuHNse1U1F09dut0NaQfHE4wa4VyN0urXq7epkROJ9soON
	7ob41t67P6G4vmoxK0DgQF2O81fx4FTH/ICu22YB0InDPDLHJYXBRuAGUHXwVHQC/CET+rf8g
X-Gm-Gg: AeBDiesLXIluQCFFEWzacNis8fpdf9zfRr4yISgwYbMLj2LUsv0pbDWze8VCEGE6bTI
	MODGk2ud76yhja/G92o4UjpYtPTFqqraeWWLZvG71n7giHUz0n51PFSOl9iUcrPjHzTJ436r0TF
	bMF34chDzKLc3XQNUdt3QqaF85+GZLt4GK1eJLiFQ1ANGaDOctQMqYQjBSKENBVH9Ned/seR3zs
	v3+pMTsVyxXnPmY9+QARqWd16vOV0Oo5xRtT+8IAQDMMjfe3JIs99i2OPAIvIry4zaXOyNdFj/N
	eisWc1fwuN05H7IU3s126vCZb/DrTe8ZuDlfnkmbM/FnpYU4khzk7s0KO7ikCQbQ6BnIcAD2Ttb
	66wHujNhmSSVrOyjo5bRgfqwmOWtVPb/IWwpryWKO7Xakh17FLt30SJ83XJA0EMj1G+9DBDHVPd
	gXmq6a5uCHrI3nBIk6BVjOajIQ/6ewj2fNYGCrqDUuHC1+3thqGvE=
X-Received: by 2002:a17:90b:2689:b0:35f:b953:244c with SMTP id 98e67ed59e1d1-35fb953263bmr3380823a91.0.1776094778169;
        Mon, 13 Apr 2026 08:39:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:35f:b953:244c with SMTP id 98e67ed59e1d1-35fb953263bmr3380793a91.0.1776094777619;
        Mon, 13 Apr 2026 08:39:37 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e411ff4e1sm13000123a91.3.2026.04.13.08.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:39:37 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/5] wifi: ath12k: thermal throttling and cooling device support
Date: Mon, 13 Apr 2026 21:08:35 +0530
Message-Id: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dd0e3b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=kPw7zogRYXnG0GdHtlcA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE1MyBTYWx0ZWRfX0EQhkVKHhmc+
 braIOj4yujdjSzvEN2DvizE0KTH54d767srg6ihWROaEBaThF6X24duMydFmV/TZQgL8w5dSdSD
 NuI2L6xVDBTdDppMpp7lDdvCSaDMDEjy2Y3KomiFR0vTKDPIdXF0TgNhfo7TzZBDaH7C6rBxOm+
 r2dMjUNABmLhT8FINpWp2dvtPeocZZsKpCl343BigqI+we+5i2ApyvfY6IFB1Qt95Yw24wCdFrY
 ZYnOi0Qnn3/AkBtTK6HiLx9das9kR8Zc58j4P5Xphs/J7QgereviWYrrb8ezu6lkI8v1Ieg0hcw
 SJrkPbpHl/PTGc8hpqh1+EjmxXNqWE/qZIpho1Z7cT76QOmlWgbApfycTs89t9s2vPLScgKIncH
 qFDiJDy1dN2CjlUZltNbWCluaHxLflPqWFoMGZ8ZyUy5X2lIpymmE2WfRDQFdCxA2XQ+OD7BLJY
 SrRKsjY40cbt174ej2A==
X-Proofpoint-ORIG-GUID: Sj9b_tpfMrwQznxHg0tSbDxEg3K0UVF4
X-Proofpoint-GUID: Sj9b_tpfMrwQznxHg0tSbDxEg3K0UVF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_083941_096930_471E21E1 
X-CRM114-Status: GOOD (  10.27  )
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

Patch 1 handles the firmware stats event so we can track the current
temperature and throttle level per pdev without spamming logs.

Patch 2 enables thermal throttling at bring-up and programs default level
tables to firmware via WMI_THERM_THROT_SET_CONF_CMDID; the driver picks
IPA/XFEM defaults based on the firmware WMI service bitmap, supports 4 or 5
levels as advertised, and only fills optional fields (pout reduction,
tx chain mask) when the corresponding WMI service bits are present.

Patch 3 refactors per-radio thermal hwmon cleanup to reduce code duplication and
ensure consistent cleanup across thermal register and unregister paths.

Patch 4 reorders the group teardown logic symmetric for safe thermal sysfs cleanup.

Patch 5 exposes a thermal cooling device per radio so the kernel thermal
framework or userspace can set the TX duty-cycle off percentage; writes
are validated against the throttling state range and host state is kept in
sync with successful firmware updates.

Examples:
echo 40 > /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/cur_stat
cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/cur_state
cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/max_state

v2: Addressed Jeff's comment by rebased on latest TOT with wmi tb - alloc and free
    interface change.

Maharaja Kennadyrajan (5):
  wifi: ath12k: handle thermal throttle stats WMI event
  wifi: ath12k: configure firmware thermal throttling via WMI
  wifi: ath12k: refactor per-radio thermal hwmon setup and cleanup
  wifi: ath12k: reorder group start/stop for safe thermal sysfs cleanup
  wifi: ath12k: add thermal cooling device support

 drivers/net/wireless/ath/ath12k/core.c    |  50 +++--
 drivers/net/wireless/ath/ath12k/mac.c     |   9 +
 drivers/net/wireless/ath/ath12k/thermal.c | 252 ++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/thermal.h |  35 +++
 drivers/net/wireless/ath/ath12k/wmi.c     | 108 ++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     |  50 +++++
 6 files changed, 447 insertions(+), 57 deletions(-)


base-commit: 9a4f673eb08d2a7713b258d671b4a45f2a6e68b7
-- 
2.34.1



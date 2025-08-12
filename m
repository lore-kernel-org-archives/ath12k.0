Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB20CA0EDB
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 19:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c4GTwShWUYy0uuN4WMoUAUveoiRhxQ7tbF2xPnkuxDU=; b=eDj13mBsE0rfdF
	fDirp4fEMNcuNJHz93XQa4oSV6XlGp30l030m8WSTiyALSdHzEInDWyruFNwlbG9ZsQAHSCgjAi8F
	n4AZT6MLhY1dfa8hAAqTFGA1zfSJzZkL8Xog6ik0x0GswhTuAsyrkeXVCjW4OwXTDuoWFPdJEXLQw
	qgHwFasQgzLGo+Rzx+E/sMjxoS+vhI89QC1simLArTVbQL2r1WrH4xzcrwdMo2Dt2gSkdJ7aVivX2
	pDeinq85un7BasXKsPWoeIcD25OOGb473BzY68qISWpLdqodKvetiRfLq1+ZAb3O06z5s8lYjEfjg
	cC98cJduop5aqfBOHYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulufr-0000000BqZr-0XlY;
	Tue, 12 Aug 2025 19:28:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsY8-0000000BWRm-3OvM
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 17:12:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CH6UQb010804;
	Tue, 12 Aug 2025 17:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c4GTwShWUYy0uuN4WMoUAU
	veoiRhxQ7tbF2xPnkuxDU=; b=kcx5xD/KnvfDD/qkK9Xlqt91L2btkUPgcN4vYF
	jxyeLeLhN1wbYa59v9z+FBwlicjlkttsPx/5BFVYDIQqIYQhyTWtMuzg7BIODMsq
	IKhbd9N0XixO80E6XVuB33hzB7D9EaTXYRz+xuBC1CB5OlBtclM68qkw/qPIUer2
	O5avBsKfFR8vEif0gGTutIJ3bCwYfiUicq4sLIHfo+O4WQckY9jPQMllvkEJW2Px
	JY098KkF5JTKmsYvKHsIXpFbFrIgE1Q3n2FJOq66vdQ5SjIzc6syWWNsn01cGbRb
	keo6qvd0VYMSOwFN79dIGjwdIINdcHRR8f/U8yiiB7Id2MFA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9r0gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 17:12:35 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57CHCYRg010243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 17:12:34 GMT
Received: from hu-kiranv-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 10:12:33 -0700
From: Kiran Venkatappa <quic_kiranv@quicinc.com>
Subject: [PATCH ath12k-ng 00/13] wifi: ath12k: Ath12k modularization
 changes
Date: Tue, 12 Aug 2025 22:39:26 +0530
Message-ID: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZ1m2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0Mj3cSSDEOjbN3c/BTdpBQDA0NTs5Q0oKQSUENBUWpaZgXYsGglqLq
 8dKXY2loAvipOVmcAAAA=
X-Change-ID: 20250812-ath12k-mod-bd00156df202
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689b7603 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=ULihl7S45PbkGyYbBi0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: xKqW3gbTLEbGZBOgst_e6HAWJcnWoKRU
X-Proofpoint-ORIG-GUID: xKqW3gbTLEbGZBOgst_e6HAWJcnWoKRU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX8KT922IAQ7gh
 ZMSVczKQ6a2gPWhdvqbi00BC14ALTzu1b0Z6hAN39Hjk5dSOQAVDYSFuCfiau+y7nWqzGhkwfyi
 d1mZPQeqAkvEm1tGezH/wTpPb13VEv2YBTDlLCPvuKNFRET9cTXra33s0OaruplolyprsJXJA/D
 C4LtAybjUTk8nadHv+x9qebDQBfm1gfwoAfReykcfqazk++Tvx4M2XRnyvKDXd6WgPggII/i/lB
 dxj7TA3x5XHC30WzCRkIh7C1w6Op9JKysPE/8nyLZkXvKIcwhutxRNq+wHAdlKIYlpqSDxszrJh
 845kyUutwdw1/Sv/xsaecOHhLv0+EAo60+PClLfP3u/EoOrQ4E9Z4CsSxPFHcJhI0I01J1FPYz9
 bvgPm2Zg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_101236_865478_FDE06846 
X-CRM114-Status: GOOD (  16.02  )
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

Current ath drivers have separate implementations for different
classes of devices. For example, ath11k supports WiFi-6 devices,
while ath12k supports Wi-Fi 7 devices. However, there is significant
common functionality across these generations due to shared firmware
and hardware architecture. In the existing driver code, this leverage
is achieved through code duplication. As a result, when a new driver
is introduced, many features are missed, and new additions require
porting across different generation drivers.

To improve reuse and maintainability, ath12k should be split into common
and device-specific modules. Common code can be shared across multiple
architectures, enabling better leverage for future hardware generations.
generation drivers.

Firmware interfaces and core initialization sequences are typically common
across different device families. In contrast, hardware register offsets, copy
engine mappings, and HAL configurations are usually hardware-specific.

Common components include:
      - mac80211 interface: Control path operations are mostly common across
        different ATH hardware and will be shared as much as possible.
      - Firmware interface (WMI, HTT, HTC, QMI): Firmware messaging and
        sequences are common and maintained with backward/forward compatibility
        using TLVs.
      - Datapath: Data path files are also separated similarly. More information
        will be provided in later patches.
      - Core initialization, reset, and recovery sequences: These will be part
        of the shared code.

Device-specific code includes:
      - Hardware capabilities, configurations, HAL, and other
        architecture-specific logic.

The original ath12k.ko is split into these two modules as depicted below.

                                      +-----------------+
                                      |                 |
                                      |   ath12k.ko     |
                                      |    (common)     |
    +---------------+                 |                 |
    |               |                 +-----------------+
    |   ath12k.ko   | ===========>
    |               |                 +------------------+
    +---------------+                 |                  |
                                      | ath12k_wifi7.ko  |
                                      | (wifi7 family)   |
                                      |                  |
                                      +------------------+

The ath12k.ko module will serve as the common component, while ath12k_wifi7.ko
will be the architecture-specific module for WiFi-7 devices.

After this modular separation, adding support for a new device will
primarily involve implementing device-specific code, while reusing the
majority of the shared common components.

---
Kiran Venkatappa (13):
      wifi: ath12k: Restructure PCI code to common and Wi-Fi 7 specific logic
      wifi: ath12k: Move Copy Engine configuration to Wi-Fi 7 specific file
      wifi: ath12k: Move Wi-Fi 7 WMI configuration to dedicated file
      wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file
      wifi: ath12k: Rename hw.c to Wi-Fi 7 specific implementation file
      wifi: ath12k: Rename ahb_hif_ops to reflect generic usage
      wifi: ath12k: Restructure ahb.c into common and Wi-Fi 7 specific modules
      wifi: ath12k: Move Wi-Fi 7 specific init routines to dedicated file
      wifi: ath12k: Move hw_init invocation to target-specific probe
      wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components
      wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity
      wifi: ath12k: Remove HAL defines from shared PCI code
      wifi: ath12k: Remove HAL define dependencies from shared AHB code
 
 drivers/net/wireless/ath/ath12k/Makefile         |   4 +-
 drivers/net/wireless/ath/ath12k/ahb.c            | 139 ++--
 drivers/net/wireless/ath/ath12k/ahb.h            |  27 +-
 drivers/net/wireless/ath/ath12k/ce.c             | 301 -------
 drivers/net/wireless/ath/ath12k/ce.h             |   5 +-
 drivers/net/wireless/ath/ath12k/core.c           |  38 +-
 drivers/net/wireless/ath/ath12k/core.h           |   7 +
 drivers/net/wireless/ath/ath12k/debug.c          |   4 +
 drivers/net/wireless/ath/ath12k/dp_rx.c          |   3 +
 drivers/net/wireless/ath/ath12k/hal.c            |   4 +
 drivers/net/wireless/ath/ath12k/htc.c            |   2 +
 drivers/net/wireless/ath/ath12k/hw.h             |   2 -
 drivers/net/wireless/ath/ath12k/mhi.c            | 130 ---
 drivers/net/wireless/ath/ath12k/mhi.h            |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c            | 215 ++---
 drivers/net/wireless/ath/ath12k/pci.h            |  28 +-
 drivers/net/wireless/ath/ath12k/peer.c           |   2 +
 drivers/net/wireless/ath/ath12k/wifi7/Makefile   |  10 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c      |  71 ++
 drivers/net/wireless/ath/ath12k/wifi7/ahb.h      |  20 +
 drivers/net/wireless/ath/ath12k/wifi7/ce.c       | 973 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/ce.h       |  22 +
 drivers/net/wireless/ath/ath12k/wifi7/core.c     |  44 +
 drivers/net/wireless/ath/ath12k/{ => wifi7}/hw.c | 798 +++----------------
 drivers/net/wireless/ath/ath12k/wifi7/hw.h       |  13 +
 drivers/net/wireless/ath/ath12k/wifi7/mhi.c      | 138 ++++
 drivers/net/wireless/ath/ath12k/wifi7/mhi.h      |  11 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.c      | 188 +++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.h      |  12 +
 drivers/net/wireless/ath/ath12k/wifi7/wmi.c      | 105 +++
 drivers/net/wireless/ath/ath12k/wifi7/wmi.h      |  15 +
 drivers/net/wireless/ath/ath12k/wmi.c            |  97 ---
 drivers/net/wireless/ath/ath12k/wmi.h            |   4 -
 33 files changed, 1956 insertions(+), 1480 deletions(-)
---
base-commit: d9104cec3e8fe4b458b74709853231385779001f
change-id: 20250812-ath12k-mod-bd00156df202



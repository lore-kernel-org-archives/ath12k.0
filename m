Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF5EC4452D
	for <ath12k@archiver.kernel.org>; Tue, 21 Jul 2026 23:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zwbc3ZwNB95OyYbvd9mIfmFmpdIbDNip3CDUKn9MSPY=; b=C1My96PvH8KaGbDRdn8ynT3BVD
	ylS/Usp26u8lqKchJcVJBZXPMDQKufuJvLHMIC6KLcFf12AuhleiTTExSQk6enPcgQJ9MVRYEemig
	12VVEkIzMf/RqLRVVT26Bit4E4jXo7Yra7hgC+uBMqVvt/BB7Qkv4zSaPAjUpvhHZ+e1xuqCS0O1j
	cPXOl7CZXI3HSx3eLy6HwxPLdxoAJG0aewlCbgz0AJ24beQL0MVHfjPHb1v0Sy2HIEAdSyoIBQda5
	DR4ybDwcSFJ51OVZhGJZ6ShjhCeeJPGMCJhM5Toqa0kxIEy1KuXuVf8EG6wwcCuNknwVcRlQCdPkf
	5Muy2zdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmKAh-0000000Abqu-2m3d;
	Tue, 21 Jul 2026 23:46:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmKAe-0000000Abpp-2ZqE
	for ath12k@lists.infradead.org;
	Tue, 21 Jul 2026 23:46:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZ2Qr2624837
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 23:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zwbc3ZwNB95OyYbvd9mIfm
	FmpdIbDNip3CDUKn9MSPY=; b=b9osd8YlwiBsSsIMn/kZwdZFVq2e+l4AADReWC
	gK6o9FNwnZ7PgnDxJHC3f0inf+o2FfwFYlp7mNQHfoT+K9ukHDEGPwqCweDABEWe
	9Hcgq08WI2PaQ3bThQ03TCHLzqkOfFxm7EuqKcl/Vd2eRsIgPR/9otVRIPhQfksz
	Okxy5wcybr5781sgN5KAse7j5nx4zlx8aK8QQOlzWgfzTNOfAxR5eATvgjBMjbE4
	qR+QEwSbBdTwQimkpIxGu8ghG4OGTnCCDrNhUoZOCvKOW9nTrxwUFlQlxlzC4gWg
	/c41dNPZrm6cLHr/+HpGtwCjxi6r7h6cUd/iN0CC5eDlLvBQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fsbx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 23:46:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so20289289b3a.1
        for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784677603; x=1785282403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zwbc3ZwNB95OyYbvd9mIfmFmpdIbDNip3CDUKn9MSPY=;
        b=AakNKfG2+FWQ8KhWDZreFXy3gsaub0Q1/fwcK5DY3ywa5D9uqkF/LwN/Gsf3xyePtu
         YLNR3CoKp4W4WlB0qqEliHcpS0s7awjSDRKKGZA3Sjco9BMOzsHu+EYaGW5oHC4Khg56
         ii/H5c2xQoxuwygS5asm66ray+T3enKpT15iJYgNZLgacafFxhRuoy27MgTDyscW0i0l
         3RA7Nw1nDEfgWJEs/CSUX5U0L7oR8vvn5YsehJRu3oxtGalvsAb9LsstSdKfIw6G7Fb0
         mWDpVe//EDsMM4MWReiYf6MqIeqSJzfvW1nBBYyA9l3e932DLmJkStx8xQhzgbxRcIPb
         mA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784677603; x=1785282403;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zwbc3ZwNB95OyYbvd9mIfmFmpdIbDNip3CDUKn9MSPY=;
        b=n7nJlJIMR1OBYnQSZ3VP4kw0SpUjfUFOZ13O2WF/4RO5lWvH75aKbm/843BRKJu1bT
         wqOwCT1DvsR34yOj0FNjY42xnwk395Z/gEz9kJ0R0AwbrlofVZ5r/+Cq+SbMWmKpI4na
         32BZv7AVozXLp+7YjzZpFt24as9I/cf0afukKFgPuabhoPh/KgI2htBd8nClFUdMvQ3r
         FKoMogBQxH4uXx9x21rHB5VG+V25dbF8DHRS26D8u4UdisPSiZg0X2X7ppqzezn88QAd
         Gj9nM7sNjBq2WO6YO5nJoeqxyPNuB8pxoxq30pxp404m8AGlD/RAaWlsGFz7xaIpt0D4
         t1JQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTOv5na2zW+bu0cabsdKwCO1WKrb2h6y/8bLtYEqoSgF3DewdIMz8fFjlDQfO5mOfyXYM5pJU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvTe+K9R6svPZPV3VdtMcYQlH080utxPWD1waVGNQZLAEsaYU2
	9+MQ8gOwSAuSQINV/+kWlt7Ew9vWNjDp3WDPLxiVoFxF9KZlohUKuypCuX71MHZUpL4HsxSbTQs
	xK7j0AWyljGlDvjQ+pEiMA9zzJcldgdsrZxhZyi/yYWkuXjNX2E+BodMq4/uuec4Q
X-Gm-Gg: AR+sD11gat8Jh7g28SGlWAZmnt+vZrFrMFmglTuhd+ANcyXFs2zMr5YvKxfKtAP3Lpz
	HPyZ6p4CKKFWG8MZ34UYXQAlq2P85dYUt5J0vmYjBnCiQhTe5cK/8ZIcIv0uKWequtbl5BYhZ/X
	SKQ0zravvgBFxFGHHaitDczI3X/UmeOkYCA+Tp27jhEVfyTSts7EW+qS8+++YGwkvZWLcGxHDsI
	p+Zlu70ueANN6ez3qqfD75FdsehNLCrt5n+EoxxJbJjHz9PjO+K1yipgf4puyf0JjrbKERfnOKg
	eY9mBkuEeaOGRoLtstOeuI9A17OtwEAJiyKUA8rl3jHtg/Sm9D5D0/77P7D5n9DT9qFfXt4B3hd
	m8WUX0suFuSM4KkEB5K1Gir5aa7J4cdqnyq/2
X-Received: by 2002:a05:6a21:2d4b:b0:3b4:85db:1bed with SMTP id adf61e73a8af0-3c3ad9d1b96mr22906803637.45.1784677602589;
        Tue, 21 Jul 2026 16:46:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d4b:b0:3b4:85db:1bed with SMTP id adf61e73a8af0-3c3ad9d1b96mr22906781637.45.1784677602134;
        Tue, 21 Jul 2026 16:46:42 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm2503310eec.25.2026.07.21.16.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 16:46:41 -0700 (PDT)
Message-ID: <f73b76bb-dc27-42d0-8e47-b617eec766a6@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:46:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260721
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OVSfQZOuXbWjzxgAQBK0sCLoSQ0yQnE1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDI0NSBTYWx0ZWRfX709/ErqlN7Du
 evJCA+kfdRCFQ66v4sRec4ko1dNUkYuaScjxCQB2xyxx6QEfmJqjDxYy/MUDebqtg6Ij66z7y3b
 EhP5Pnoqc8YWRpf51yF3bayUnBcLCnybL5Hw4sjb0zgl0BqqWYbMSi9HL/x21ZPrJGpXuF60jZm
 /ohZd/kKSbuIDUuXfvGCOhBxl8gYaRJDXuadgAlfC02Apo2mJwYr7hO/kQ9NOoHZvG1g6yykKO3
 Gp1t1XFQBMnHEOSPr2jfxxwTPIelUX6nq8ZC8WtJQLny7fJ+yugQS0aiLUmj/iFN48AgdLcu5N2
 CcK4IwvIIPuXE7Sp4NszyzzNzeIXj4YlKsvkpql64RlOPvbjBZsGSy1e1ZRYafvTAThnrE3ybzy
 UVokDpMuMy4YSsWUQs5A9jdLjm5nXhLLlo7lKKFcFiQGvN955d8nXMDz0PvpLg9iXAADkYYl8Np
 oT/hhf0zJezkcaZQFwQ==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a6004e3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=h0gdpq4wJxyY6LqPCyoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: OVSfQZOuXbWjzxgAQBK0sCLoSQ0yQnE1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDI0NSBTYWx0ZWRfX4u+JaKG3uoVu
 E7b8MqVCIHZPQcYcg+NnsEMUFJqOUZscTLfdBensHIFV66gCcJrlhvn0/OdESSUxULZRNiq+LD0
 I/GDFST0e9fOUfrB+VoPV5dxfBKzm5Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_164644_691861_A99FF2E4 
X-CRM114-Status: GOOD (  15.61  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260721

for you to fetch changes up to ca27e3c2284a7a43ba390ed5ce0d68b3c869c0ce:

  wifi: ath11k: add purwa-iot-evk and qcs6490-rb3gen2 to usecase firmware table (2026-07-21 13:00:02 -0700)

----------------------------------------------------------------
ath.git patches for v7.3 (PR #1)

There has been quite a bit of activity across the ath drivers.

Significant changes in ath12k include:
Align with new Qualcomm generic Peripheral Authentication Service (PAS).
Ongoing infrastructure changes to support the QCC2072 platform.
Ongoing infrastructure changes to support the IPQ5332 platform.
Enhance datapath statistics.
Tuning of datapath parameters.

In addition, an assortment of cleanups and minor bug fixes across ath6kl,
ath10k, ath11k, ath12k, and carl9170.

----------------------------------------------------------------

NOTE TO UPSTREAM MAINTAINERS
This PR includes the merge of an immutable branch from the qcom tree
https://lore.kernel.org/all/178362521364.2422497.1305957434056184382.b4-ty@kernel.org/

----------------------------------------------------------------
Aaradhana Sahu (8):
      wifi: ath12k: remove unused QMI definitions
      wifi: ath12k: expand UserPD ID mask to support up to 8 PDs
      wifi: ath12k: correct monitor destination ring size
      wifi: ath12k: add QMI capability negotiation for dynamic memory mode
      wifi: ath12k: update IPQ5332 BDF address offset
      wifi: ath12k: switch to name-based reserved memory lookup
      wifi: ath12k: refactor QMI memory assignment
      wifi: ath12k: allocate HOST_DDR and BDF regions after Q6 RO region

Aishwarya R (1):
      wifi: ath12k: reset REOQ LUT addresses before firmware stop

Alexander Wilhelm (1):
      wifi: ath12k: fix scan command endianness on big endian

Baochen Qiang (3):
      wifi: ath12k: fix dp_link_peer dangling references on AP vdev rollback
      wifi: ath12k: fix MLO peer delete race
      wifi: ath11k: cap out-of-range rx MCS instead of leaving bogus rate

Christophe JAILLET (2):
      wifi: ath12k: Constify struct ath12k_dp_arch_ops
      wifi: ath6kl: Constify struct cfg80211_ops

Daizhuang Bai (1):
      wifi: ath12k: Set DTIM policy to stick mode for station interface

Hangtian Zhu (2):
      genirq: export irq_can_set_affinity() for module drivers
      wifi: ath12k: enable threaded NAPI when DP IRQ affinity is unavailable

Jeff Johnson (7):
      Merge qcom PAS TZ service series (20260702115835.167602-2-sumit.garg@kernel.org)
      wifi: ath12k: Fix ath12k_wifi7_mac_op_tx() style issues
      wifi: ath6kl: avoid buffer overreads in WMI event handlers
      wifi: ath12k: Correctly copy the hint BSSID in WMI scan request
      wifi: ath11k: Correctly copy the hint BSSID in WMI scan request
      wifi: ath12k: Avoid buffer overread in ath12k_wmi_op_rx()
      wifi: ath11k: Avoid buffer overread in ath11k_wmi_tlv_op_rx()

Krzysztof Kozlowski (1):
      wifi: ath10k: Drop redundant NULL check on devm_clk_get()

Manikanta Pubbisetty (1):
      wifi: ath10k: trigger hardware recovery upon rx failures

Manish Dharanenthiran (1):
      wifi: ath12k: advertise ieee_link_id in vdev start MLO params

Masi Osmani (3):
      wifi: carl9170: mac80211: document spatial multiplexing power save handler
      wifi: carl9170: rx: track PHY errors via debugfs
      wifi: carl9170: cmd: downgrade transient register I/O errors to wiphy_dbg

Matthew Leach (1):
      wifi: ath12k: fix survey indexing across bands

Miaoqing Pan (7):
      wifi: ath12k: fix TLV32 length mask
      wifi: ath12k: refactor HAL TLV32/64 decode helpers
      wifi: ath12k: add HAL ops for monitor TLV header decode and alignment
      wifi: ath12k: add dp_mon support 32-bit TLV headers
      wifi: ath12k: tighten RX monitor TLV bounds check
      wifi: ath12k: fix ML-STA authentication timeout on QCC2072
      wifi: ath11k: add purwa-iot-evk and qcs6490-rb3gen2 to usecase firmware table

Nicolas Escande (1):
      wifi: ath12k: avoid setting 320MHz support on non 6GHz band

Pengpeng Hou (1):
      wifi: ath11k: validate regulatory capability phy_id

Raj Kumar Bhagat (2):
      wifi: ath12k: Fix inconsistencies in struct qmi_elem_info initializers
      wifi: ath12k: use %u for unsigned variables in QMI debug logs

Sreeramya Soratkal (3):
      wifi: ath12k: Use runtime device count in dp stats display
      wifi: ath12k: Add timestamp to dp stats display
      wifi: ath12k: Show per-radio center freq in dp stats

Sumit Garg (5):
      firmware: qcom: Add a generic PAS service
      firmware: qcom_scm: Migrate to generic PAS service
      firmware: qcom: Add a PAS TEE service
      MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
      wifi: ath12k: Switch to generic PAS TZ APIs

Sushant Butta (2):
      wifi: ath12k: Skip setting RX_FLAG_8023 for Ethernet-II (DIX) frames in monitor mode
      wifi: ath12k: Skip peer link info update in rx_status for monitor MSDUs

Tamizh Chelvam Raja (2):
      wifi: ath12k: Advertise multicast Ethernet encapsulation offload support
      wifi: ath12k: Set IEEE80211_OFFLOAD_ENCAP_4ADDR after tx_encap_type vdev param

Thiraviyam Mariyappan (2):
      wifi: ath12k: Reduce RX SRNG interrupt timer threshold to 200us
      wifi: ath12k: Set congestion control max MSDU count

Wei Zhang (1):
      wifi: ath12k: fix rx_mpdu_start layout for QCC2072

Yingying Tang (1):
      wifi: ath12k: change MAC buffer ring size to 4096

 MAINTAINERS                                        |   9 +
 drivers/firmware/qcom/Kconfig                      |  22 +-
 drivers/firmware/qcom/Makefile                     |   2 +
 drivers/firmware/qcom/qcom_pas.c                   | 298 +++++++++++++
 drivers/firmware/qcom/qcom_pas.h                   |  50 +++
 drivers/firmware/qcom/qcom_pas_tee.c               | 479 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   | 335 +++++++-------
 drivers/net/wireless/ath/ath10k/ahb.c              |  12 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c           |   6 +-
 drivers/net/wireless/ath/ath11k/core.c             |   4 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  30 +-
 drivers/net/wireless/ath/ath11k/wmi.c              |  16 +-
 drivers/net/wireless/ath/ath12k/Kconfig            |   2 +-
 drivers/net/wireless/ath/ath12k/ahb.c              |  29 +-
 drivers/net/wireless/ath/ath12k/ahb.h              |   2 +-
 drivers/net/wireless/ath/ath12k/core.c             |  34 +-
 drivers/net/wireless/ath/ath12k/core.h             |  13 +-
 drivers/net/wireless/ath/ath12k/debugfs.c          |  14 +-
 drivers/net/wireless/ath/ath12k/dp.c               |  14 +-
 drivers/net/wireless/ath/ath12k/dp.h               |   5 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c           |  70 +--
 drivers/net/wireless/ath/ath12k/dp_mon.h           |   4 +-
 drivers/net/wireless/ath/ath12k/hal.c              |  42 +-
 drivers/net/wireless/ath/ath12k/hal.h              |  15 +-
 drivers/net/wireless/ath/ath12k/hw.h               |   1 +
 drivers/net/wireless/ath/ath12k/mac.c              |  96 +++--
 drivers/net/wireless/ath/ath12k/pci.c              |  12 +-
 drivers/net/wireless/ath/ath12k/peer.c             | 130 ++++--
 drivers/net/wireless/ath/ath12k/peer.h             |  14 +-
 drivers/net/wireless/ath/ath12k/qmi.c              | 429 +++++++++---------
 drivers/net/wireless/ath/ath12k/qmi.h              |  34 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp.c         |   2 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c     |  66 ++-
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |   4 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  13 +-
 .../net/wireless/ath/ath12k/wifi7/hal_rx_desc.h    |  34 +-
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  13 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  73 +++-
 drivers/net/wireless/ath/ath12k/wmi.c              | 165 ++++---
 drivers/net/wireless/ath/ath12k/wmi.h              |  26 ++
 drivers/net/wireless/ath/ath6kl/cfg80211.c         |   2 +-
 drivers/net/wireless/ath/ath6kl/wmi.c              |  17 +-
 drivers/net/wireless/ath/carl9170/carl9170.h       |   1 +
 drivers/net/wireless/ath/carl9170/cmd.c            |   4 +-
 drivers/net/wireless/ath/carl9170/debug.c          |   2 +
 drivers/net/wireless/ath/carl9170/main.c           |   8 +-
 drivers/net/wireless/ath/carl9170/rx.c             |   4 +-
 include/linux/firmware/qcom/qcom_pas.h             |  43 ++
 kernel/irq/manage.c                                |   1 +
 49 files changed, 1926 insertions(+), 775 deletions(-)
 create mode 100644 drivers/firmware/qcom/qcom_pas.c
 create mode 100644 drivers/firmware/qcom/qcom_pas.h
 create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
 create mode 100644 include/linux/firmware/qcom/qcom_pas.h


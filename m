Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4644E7DEEE
	for <ath12k@archiver.kernel.org>; Mon,  2 Feb 2026 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eAWb4km5TleWO/t5iavF0aQqzr8+qMuKOS8aZDkQyDU=; b=EXWxSG5m8mcE46g8U68ggdZThf
	GLgKbBjER86OicXvYjjS8vlUV0RK/viQ8BBKN0kcfcesUkGBhNI2RiVR9RqyAgI7MdfPFoSkLQlWi
	INPChlPnBLk/NDVjbTRfi87p2G8SLf9kXkk17lnz6RoxUrfXhYQcS/oUefBKW4wloy41CUrtGGqPj
	VrDnJLbubDjfZDm4ocwRnpn7AW1+aM5W9WpMAKzhJJI8LWT9IYBKvd+DpM1nf5EdVJ40C7l+AS/IT
	tvE7cJsuFFpTzgGKT4bamsH6ddz+eElJV7qShbVftsTzjc9qh0+dz3piNyGJ6WAJ4F+6D0TwyxkZs
	2Amz3i7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmv30-000000056pc-2ElY;
	Mon, 02 Feb 2026 14:37:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmv2x-000000056oR-0YGn
	for ath12k@lists.infradead.org;
	Mon, 02 Feb 2026 14:37:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CJXLS2884426
	for <ath12k@lists.infradead.org>; Mon, 2 Feb 2026 14:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eAWb4km5TleWO/t5iavF0a
	Qqzr8+qMuKOS8aZDkQyDU=; b=K03YTCDh88rDSmPGCDsBvsMoc7RhBbElFTVDfZ
	l52z6+FxCIoL283X3IfYkCXGFoM+ul5cMVA5NFz86voYlVvEpYoMIMuEWA7iF2SN
	4ZjH47I0tHAc8doVZhV0OKEGD7NvRLvpG0JOxELNRzb12mXPpgD4tEdCrUVaeCVo
	NpsxHxY8AagL+shDT3hHNjlyWi/BlDS+wbi00wVBn4TaY1/L/pVJJkeYDvDd6Vmt
	uCmI01BbTkvne3wsIaFNxDWa6Fy+bpfWh/CCm7z9mVRayp+AEFeNawVd09oBQ3GK
	2iiZh7xGYlyCZ9lzU8jcHOYqvjRsbZKoweyAi5ysi4d2Sqew==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3gbx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Feb 2026 14:36:58 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1249d001040so2895092c88.1
        for <ath12k@lists.infradead.org>; Mon, 02 Feb 2026 06:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770043017; x=1770647817; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAWb4km5TleWO/t5iavF0aQqzr8+qMuKOS8aZDkQyDU=;
        b=SlYJnhXt93EXW6jzgda9PNT/mqvK72z+kFNOFeezmr4VU43AEkmTjGLXuH5oa9XVAd
         ROwMiUai3FEcpQu/xy4v55mJ48xkRQA8bTWoYFQ4iY5eKlwMlLHtQQdlAUviHFoPn+fe
         rQAUdZT4QNIAGZC0lojI0EwqiT7q89NmCawha5lEIkdeukjsuFsu+ld7wAj2GImtZFRq
         s2Ed7F5KAbAjDwGPcIGLjlXbhh2FhuLnTqF+RQG4Nt4v8TPPCG9kcyESmMit6AW5Pi57
         HId7pIJ8ERlVIrcRSp6rFPZ8s95DKCjix/OVH3p6OTRvlTX/GMaQvx44A41dRijwRJOh
         H2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043017; x=1770647817;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAWb4km5TleWO/t5iavF0aQqzr8+qMuKOS8aZDkQyDU=;
        b=KaLDAF2IAjz9CkvU56LBIUaVMxbZ5k6hK6myXrlTbZwrW6raTKXHIApj2pTHlWwVip
         ZJykMOfKXiXIe39dJilTXrnizWh4DDQO4lZR24dClRBZMDQUtOgXqD42oH+NbW9X0Ykt
         Gnm5rNtur15Ao4EGrX1AV72mYj/WXKayvjlMSd/CNRUUxuIyQqMJlmo1VF7qnOEDND/t
         YjOWAPaoop0f3uQOxGAcISOk6snR+uvbXBaE1W7NygPEW7bFAt1QBIImxz4MKWQjGdou
         RWR80zHdvdntDR+iiHBWlItIgfJINdEaJ0kC95gOd5IBvsjCk8F0IoOzN1lyK5DfkHOY
         /aZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAFuJ54iol4FoY6TQuhQI5OWj1AFdDuRHimVvi7Iik2sHLzOOjQ9omO8Cnr37n1bgm6nrHkSI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDIchUYe62FFcka0PDR6Ew4HscH8U2UIKQvN6Nw1lbdtDIRf2u
	chaBMRBhS4D1AttR7vZS/DfYHxA0Nnf3PW7BRd6rb6uaOhRViLBi4rHEwAr7vJzwwunLh60V7OP
	eaYOdBbckAoLrNYfJbPB5lW7+WWbCZAfWOxmTa0eSML8WNe4ywsKe4IMiUdnttT4+
X-Gm-Gg: AZuq6aLypIL7MLgFyj+u9hPSkYyEuwUY/2UQt7h5Nz9YnSMIpkDfH4a0IUaF9TQn5wp
	ue97BfGNEsLzGvuN7UzFU6GXN53dfJVRsBYQZnRyJtHyRCMvmwatEvWXSgcDekPrb3n867ZPs4S
	wsI+gBqqaMO+lX1IqtZZbtvCBtX2Z0O2Qr3Zcjys6zS8DI/hAGe/37x/qzM6qc927na8VtdUU6Z
	KmPXmTF1R3gWBWecak99c48jwCsgUeFKW8TpZy2TooD17orCptfNu1WnvYOmHsGymg26SLC4iwk
	3IpISGAY9tTbg8i3k0Np8JfIWSalYV+OF2K1cMKa0UVbr54TCAuTk7he/jlCFzRnFZaDymZw6wh
	ytfBiCeRZiaHgpdeiUPK9VXc3uV/pjMO1LEaidojLhr2F0w==
X-Received: by 2002:a05:7022:2485:b0:119:e569:f86a with SMTP id a92af1059eb24-125c197f8aemr4890414c88.7.1770043017335;
        Mon, 02 Feb 2026 06:36:57 -0800 (PST)
X-Received: by 2002:a05:7022:2485:b0:119:e569:f86a with SMTP id a92af1059eb24-125c197f8aemr4890386c88.7.1770043016725;
        Mon, 02 Feb 2026 06:36:56 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9debe5dsm19571387c88.11.2026.02.02.06.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 06:36:56 -0800 (PST)
Message-ID: <28dfd5c2-9c97-420c-a37e-e43b215799c0@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 06:36:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260202
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Is8sjVyoKIlfSPyT8aOkRly58u0DrIap
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6980b68a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=qSke-fb0mpNoTSwYOz8A:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: Is8sjVyoKIlfSPyT8aOkRly58u0DrIap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDExNSBTYWx0ZWRfX/ooRgYRUPKGz
 S6YUFnDNSx4p4GGVXVxSRilMPqJZ0aqgFiHXRfxx2eMW12ciULqQO2t83G5cz8OUdIraM7v2Yq8
 bJaSdJ+T0LKU6+mGqSmIgpwhl4hxFGL1UXicYB5fu7mrxh4eARLJ7uItZTkgbzRCl5XV9N4XfTI
 mBGOmgXFzy+PSUGxKNT2n4Jk6Q0ohwUPqJh/ybT2BEUNIWpoQOBLibGZdVnfPRAXuYBOnJkhOBj
 Vau2Cq1afQBEYA055vUjEPDiD2E0/DMNys46vn1orI1rdBZIW+RV3Lg1qH6J1OdOzVc/TxLWSgz
 Astvm+4LcOd1KmUeMimfzYjoEGZqv7ILKq3+LTEAw6e9W4VFst8rh3J2QaeRR314hANVUhWMdMg
 GXIc7GeoG3mHhQ8ZuH0xzTVeGSTOwDJV6SnZvFmee61mj3wgjRa3Xu+Iv4km5ba1kwkrhZ719Xc
 ojh3LkVB3oKGBvypnCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_063659_191997_048FB77A 
X-CRM114-Status: GOOD (  10.01  )
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

The following changes since commit c30e188bd2a886258be5facb970a804d8ef549b5:

  Merge tag 'iwlwifi-next-2026-01-21' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next (2026-01-27 13:54:12 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260202

for you to fetch changes up to 2c1ba9c2adf0fda96eaaebd8799268a7506a8fc9:

  wifi: ath12k: clear stale link mapping of ahvif->links_map (2026-01-30 07:12:38 -0800)

----------------------------------------------------------------
ath.git patches for v6.20/v7.0 (#3)

A set of small features and cleanups for the next merge window.

----------------------------------------------------------------
Aaradhana Sahu (4):
      wifi: ath12k: Fix index decrement when array_len is zero
      wifi: ath12k: Add support RX PDEV stats
      wifi: ath12k: Add support TX hardware queue stats
      wifi: ath12k: clear stale link mapping of ahvif->links_map

Dmitry Baryshkov (1):
      wifi: ath10k: snoc: support powering on the device via pwrseq

Miaoqing Pan (2):
      wifi: ath11k: add usecase firmware handling based on device compatible
      dt-bindings: net: wireless: ath11k-pci: deprecate 'firmware-name' property

Wei Zhang (2):
      wifi: ath12k: add WMI support for spatial reuse parameter configuration
      wifi: ath12k: support OBSS PD configuration for AP mode

Ziyi Guo (2):
      wifi: ath10k: fix lock protection in ath10k_wmi_event_peer_sta_ps_state_chg()
      wifi: ath10k: sdio: add missing lock protection in ath10k_sdio_fw_crashed_dump()

 .../bindings/net/wireless/qcom,ath11k-pci.yaml     |   1 +
 drivers/net/wireless/ath/ath10k/sdio.c             |   6 +
 drivers/net/wireless/ath/ath10k/snoc.c             |  53 +++++-
 drivers/net/wireless/ath/ath10k/snoc.h             |   3 +
 drivers/net/wireless/ath/ath10k/wmi.c              |   4 +-
 drivers/net/wireless/ath/ath11k/core.c             |  27 +++
 drivers/net/wireless/ath/ath11k/core.h             |   4 +
 .../net/wireless/ath/ath12k/debugfs_htt_stats.c    | 197 ++++++++++++++++++++-
 .../net/wireless/ath/ath12k/debugfs_htt_stats.h    |  81 +++++++++
 drivers/net/wireless/ath/ath12k/mac.c              | 174 +++++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h              |   3 +
 drivers/net/wireless/ath/ath12k/wmi.c              | 142 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h              |  47 +++++
 13 files changed, 730 insertions(+), 12 deletions(-)


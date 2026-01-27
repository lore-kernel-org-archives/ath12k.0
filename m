Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EFFD2FECD
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 18:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QVFvCbYDWuc9Uy4/cu59fEgOGvV+V4q1pRgPW41gc6c=; b=XyJbsHZ2jREIlAj4SksaCgPuqu
	XdnjRDJ6P8Pqj3+1MrbyQEBWX+2O5uSPkd9fl7P/wFkanp14w7UDVKio63UYwlSC3i+O8UWVIdBJx
	pihztqzUxZPiiNpl4BRTOO16zmtQPNDMezM/y4tS6RcIoMJ9CjP30VP2Jz4ZCZAVYXZB05lUNFLxM
	Tjst1gTnAa0jBuhcZAq2n7SLa6lxxWV3BS0dd00XUx+TjoST3TXSqUZjOzdt36v+iO1XCBj57HbRX
	O3b5PijoD0VRnOpFwHkZfi1icIHQC/UA4zRGoTnEwvxVo8XZpuDSWJegpFv1vF2oXSNjR3p7CT63Z
	HvxCJaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknQr-0000000Em5t-1RvO;
	Tue, 27 Jan 2026 18:04:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknQn-0000000Em4k-2FOt
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 18:04:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RFA58t2379299
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 18:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QVFvCbYDWuc9Uy4/cu59fE
	gOGvV+V4q1pRgPW41gc6c=; b=Wu2CaxlwPtwGU7jx4LETTa2xbPFQclY2GPd9OF
	oPy2bKq1wr46WVkA3VWYyt+o2Xg+3ggEUZiBl70EeORuGgFq5x3VqYd1VFCdEt82
	4O6RYZXtlr0GBM26TFs4oAwi81VPJhO8w1sCLJv6VevBqOYxaWPoCwMZbGjkLFf6
	gCzMgkFjAHPpEMKL76TzGoRzHIphz3oJ3zAOqrp0snxKuQwBvdiFVtxuGO3IjPjg
	lGBU76nldCzqxlckP8OgcXhm96w2BS91sraKzukOGVyF5oPLVq6IHGUxOTuEyjtj
	ghW4JoRux9nukEc6sDzdQhJrQiZsV7Xc9dnHlPFQn7SAjqCg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjra2cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 18:04:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b722bc1be1so27177392eec.0
        for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 10:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769537088; x=1770141888; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVFvCbYDWuc9Uy4/cu59fEgOGvV+V4q1pRgPW41gc6c=;
        b=Mxx9twMJmzkyns8l7wCgAOJiVtySJONrrrDWavi2D9E7Zo298Z7wqlWT9Bw2QrMP/A
         wAZ/9tFFwzFE5pfXmkkzoYkzA7/tNpDn7FOQ22qyLNAzZ0FNVYhZIESYI6Dj6XyTUQ6X
         poGCrsaBApqlCEJvKXpCd+uk94ptdjYclDZQt/Hgh6pO2dNWiqtKBng/52N/ZcA+Deug
         /4+e3eDqbL8bPPlOa8E4u1p2gOvHkenGahkRq9hShG6Ow5grzaGoJM/K6BIumhWvDURm
         AwJq//QzR8FeY8d1/WJaGmyCgDVmGI3ixRJtvWGWoUhk/MLee2QqAkvUlj1ECgPn1uYf
         td/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537088; x=1770141888;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVFvCbYDWuc9Uy4/cu59fEgOGvV+V4q1pRgPW41gc6c=;
        b=jECYUYvS06C2fsQUs93YjqF170NA9xY1UFNQySf0GSIHw0OzEbaCBTuxvKptGXU2JT
         LOt5Ue0Ql7SYpv8mZH9fmVb3741dcPDZzMf4F0X9B7RgM/viTY7TT7IgQFmpvYkiwz5q
         bstTnuQ0eM+fNj/ll2D9ng9Hgzd1r1qwiMLC5AN/GrIZjIovyZReZpd0VKk32MfS0uED
         ktuS9WW4j7tcSHwsi4RdjNoi0lHTwkO9YxPRQVELBv4HnKHOiW1piHdFkm3cwJnChviX
         q/1rOh8jLEhH/ly4zp/DOL19Df50DVB5in8Q5WGZ6FLiZR3FeU+cJ8xeP94Yra/ghGto
         no3A==
X-Forwarded-Encrypted: i=1; AJvYcCWDx202PPW/WYtfoE9NTnmdQpdfqjtNnAHbuCp/tblHGhd30NuIXG2YzM2KtMpIDlx8sjXWrxA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRVMK+NyiYZtxfD2PZR3+vONbMC2vNi1zvGq27Sbq/uI1ONgqg
	FE1erBILikvcKY+8WB60vICJ2lsbGeHV9JenxMpA5iDPyDZgIENtW6jTBZq3MX9fDGdq2/g3PR8
	r27VOUWHLv/6fPq1qdZSiZMevrxzLWrTMihzjX1UlH+GDTHesF+qpt6oGpcy7HA35
X-Gm-Gg: AZuq6aIsO+Is+K3LftO+5hrvvAZ1tP1dvVqpR2wHLZ3/dWsmE3QVFgJVsOwKXIWu4Ie
	wvQSjN2SaJyTa0kYFBbK0mUWKbY6ZPCYxD/ztKoD2PuH6n7OIjPRsAySDT8LqhP5ui5+juR12yQ
	T4ENTQnIYjWbRbuKG61tfz+8FRX9uATi9nMkx04yYUIJMj8uMdcs4Trx91smMehh/mb6sCP+Btr
	alWhNwc+TMtCOv7yYBHI9utO1YTLh/L7YlQ9npez+GTi8pfUkn6jmJ3TQVKX8TP9L5D6pbBPR/0
	8iyC0gNmfnQ6MdoIDiKGd7IRSAd8JUVUfCwyKEUcmPSzst+SJ9qWfBQ+1wsECZ9/FX5aGQS+mgN
	+NgG5pvsvxaLnjCSHFt4JK1DyxWZa0zBwpXpoAHbo0YkcLA==
X-Received: by 2002:a05:7300:e607:b0:2b7:3955:f51f with SMTP id 5a478bee46e88-2b78da13aecmr1907839eec.38.1769537088010;
        Tue, 27 Jan 2026 10:04:48 -0800 (PST)
X-Received: by 2002:a05:7300:e607:b0:2b7:3955:f51f with SMTP id 5a478bee46e88-2b78da13aecmr1907809eec.38.1769537087460;
        Tue, 27 Jan 2026 10:04:47 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b79c386590sm235612eec.3.2026.01.27.10.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 10:04:47 -0800 (PST)
Message-ID: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:04:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260127
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 67EybisYQenSlGa0K73IgZXmi4okzXPT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0NyBTYWx0ZWRfX1UMoelFudZ9Z
 LSZ/ab11IZ+AfDdCrQpnxReYLX4RE/xAiBslUcx8se5PIoTJUntQ6Xgqy9CBqyFev5B0ZPrqI9g
 H9M6Cg/mxQczxxyufaKkOEuA0D+8oVn8TtKj2uPbp04cPbAlsJ9T9jdMLA9IBCGOQC1YTZfiPwS
 /alTVj2eebpwC9jtr5tu1Ya+KuQSaE3yB5v5kUHpzAxjPiVDqbDVAYZdgJtpYIq5khm5BBtmPTj
 CHQLJ05DN8ib8GlvlsUO/Igu/GgNHmf+bBl/vCJ9LIf+V3alVVXw6FNxQZb6t8zenwbC2IvR9S3
 Xx2j7MFpq9HTZvRseciYWRS17QUSTcUE0CkniRhpaAULgFZ0k1+AwykpOk0yEDfhWobVsuhTga9
 jBiWk1/1IX4IAcXsReQyc7/DHrR/ikzxjXnYkcS1wepezeFS3OsSzN3ZTd5d95CgghAru1M68y0
 YYD0AzHhssp6wxK5gEA==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978fe40 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=lktd8AmUIn0x_5DxP60A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 67EybisYQenSlGa0K73IgZXmi4okzXPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_100449_596553_0F649D7A 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k.

For ath11k update board files for QCA6698AQ/hw2.1 and WCN6855/hw2.0 to support:
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride

For ath12k update firmware for QCN9274/hw2.0.

Please let me know if there are any problems.

Thanks,
/jeff
---

The following changes since commit 0882248d05045565bfefe1f07cbfc22276c9f058:

  Merge branch 'lenovo-ish-uspstream-clean' into 'main' (2026-01-23 19:26:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260127

for you to fetch changes up to 6bbca7605494e4a72b219c2d85a8026e8de3eef2:

  ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1 (2026-01-27 09:50:03 -0800)

----------------------------------------------------------------
Jeff Johnson (3):
      ath11k: QCA6698AQ hw2.1: update board-2.bin
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

 WHENCE                              |   2 +-
 ath11k/QCA6698AQ/hw2.1/board-2.bin  | Bin 986384 -> 1046764 bytes
 ath11k/WCN6855/hw2.0/board-2.bin    | Bin 7056532 -> 7116936 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin | Bin 15183928 -> 16035896 bytes
 4 files changed, 1 insertion(+), 1 deletion(-)


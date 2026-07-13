Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DCBC43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 16:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WNGUPRa2nMu1ajQvnmZN5w+JKhB37vaeHCrbmFos2tg=; b=3h4nQDbVxmKJeC
	vCGwB+uurqGTlmYU1vNPj6f+RjCfiYb6eQszRSe7v1h04XSbJ6wrzP3MXxDZgMdP3MM7c6i5/hcW9
	dkY50ewsvaRxwXgcoya8IeIBWeGs5wQocEsjEXL0K7Ues4XrISUWMwlKbJNKbcMJLGXBmrJ5IJ52d
	1iCLUiKtLIU4Z95K60tA5CILn7HT+xOU0v5sZsPqRqe/H/Ofk9537VMAglqb3wcpX+bicSHLOhpya
	HoqPogJSFv/LQz+EFDb5a3/loQqhTpvMs9OkQotmz+fVqy7B7iix/Qbc4ksegRSZNzIaIljYxXvpQ
	9gLAS+bfe0zjsBEZpBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJK6-00000009vXY-2qqG;
	Mon, 13 Jul 2026 16:16:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJK4-00000009vWX-2fqP
	for ath12k@bombadil.infradead.org;
	Mon, 13 Jul 2026 16:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WNGUPRa2nMu1ajQvnmZN5w+JKhB37vaeHCrbmFos2tg=; b=LGEA3GwIO7VPZqR3WWyXQGzST3
	o2phoYpCL80zsrRSaQH0kdFoxbruDk7GJxN/0wP/lCNkHUlkW+Yo8fmunzJzHELkDw6WsB0TdD7iP
	ExghINdcogfbcSv6vsB65gSyT0OaPWwz7o97XRQvvo/WipqkvZdFAd6rsAwxMnblQtx4tabw2lG7k
	Uji3S1+4gNWL5t+GmlyBl5/oM0CwHIY0lFr2rFhr23VLyjd5ZOxoxU/TwdKgnGswIVhAKtR3bl2xb
	qJuDu/Hvj1O09EWR4zBZLdVXcCPYtG0FaeqRlH7Rf3dzbIB8xwa788wcmRkhXtMs5AY7lx7uUviWu
	wxscoKKQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjJK1-0000000BpFv-1jV9
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 16:15:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8Pqs1835575
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 16:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WNGUPRa2nMu1ajQvnmZN5w
	+JKhB37vaeHCrbmFos2tg=; b=WtnFqytGP7MsMjXWUKUdaI1dLvE5vcwATVWfA5
	fuPvGC0CIYZPllH8FEqpjD49pktUIxllKTzY+yenThgbpIGFw2JdAoDyesYO6+Oo
	nKiv3J1NSK9IaHuQkNn2HqeO2Pls+4QEj3nzivXsA3TdGmd1LsbR3Ds2aR9VgR2e
	DWYMmtkU7arhs3cdV7opIGxEsQsGVQg8+CErGgtsfbDbS6OozauMLW639samUN6Z
	wII9M8wvIaJxyAn01SUHgh2FyDs3MIGfjcCbqdHUQgzpJX23+rrNP+HNmJdGhEoX
	EXi9MGDXiAJda+c6WJw8n0FJo9dktppqEm3U/Q76nGylGRGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn21bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 16:15:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc8d877eeso3090600a91.1
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783959353; x=1784564153; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WNGUPRa2nMu1ajQvnmZN5w+JKhB37vaeHCrbmFos2tg=;
        b=PopWCkPsbWDVSN5sHg9HwYwtfRlNIdXk/cYi6haXMsBdpIiEVvSsBTkpGPGWDBLF3K
         5/XrUVr/hPkL4MeSQN251cOyjbYCI8eHm4jiLEmpPqGaYGcR8DTI3ZknIW/n5YMjxPM6
         yOCccQoo38ZrNPEvwJUmI5uaWoS3TE/T7TMvQ9CPYxJQTMReYtYx9fOMrt1wdkpaglmZ
         OGxe3xkBGXTJdW2Mq1T6iZ5or5MKe/bpWkWYBxeXHk4vbFTIgocZsm/aKQVEle3Iq6TR
         XoYA5LjU9XL56auYTplSO5JYC3GtOonWoTbXAE8T5bJPJbId5v941By1UIopU12LFie9
         imKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959353; x=1784564153;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WNGUPRa2nMu1ajQvnmZN5w+JKhB37vaeHCrbmFos2tg=;
        b=rZJzL+iCR1jQQ+5o0TEjXXAP1B0oVEsf4CXouirM9OYtcwGQl24DcBHKZKHOCdiLj+
         k4TiV7/zeQCAL0AavLGschliWqOmtvMvvuFSQvU0sNPzH62NlVvGbQQpxX8apzIha3Hm
         gay+YKxTfN2y1iuL9TWiVrTQyT1ZzPDW0n1rUb8DfDEXpsPfmT4r1vN6IAOml9B/wZws
         SJe0Ou36OObi0wvyATfgd++FbaZzyRXQcCIfP6zpQaUNGOyL6k6p5ZNN/bpLrqovbRz9
         /2BHlY7rrb7TL47nfNkQPXi2qDsBnkfxzHmXhTP5HAvawcC+RUO5t4by9aKcLWAnvKs1
         gsZA==
X-Forwarded-Encrypted: i=1; AHgh+RrX6+gQ7nXKal1myCumtHbcRFOO2/VdyjVSjdsxqsG/mayI4o8G/WI5qEkivRStPLKsSuqLDF4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZC/DPfV83h9HwPgie9ZNPa53V4wFHnP3XRfpm/Hy4cm+sLneq
	D3w24tVdQWFtLn2MeFLQPco0UBxlf1FobPcuF29Ri+EvVQGDX/K4A0dxy5MlPq5elxbhNv4HpHK
	ORtboiVLw0ksk8mimHwA1B9f9Fh2tkiVKTbqyrUq8g8GIdX0/+FYRO2ceUSRLg1q+
X-Gm-Gg: AfdE7cl10RzpMmxT16A8TelRB5i01/2djKzQSKfq0UCoJbcd9EpfJjSe9kcpHFwb8YO
	cI6b7I9zJoay69yjiCAYEhv6TdHHqzabvrpyCOfIQuESF1TYglmWTOxz3T3CgxAp2Mc8OGQuwTg
	sU/cjIjGIDAaVpmLKPYCP4rhMPHL9ELfj8nJxHXDZkNUyB8bhmxYA3o3qAcxQQthvP0iCZparTr
	syOWvwpnzUbLu/SFZ3kCDF72FHjKfRoDzrxYoWVR+yGUhZAKtKFqN1DX9b4tC30VJz5pNdbptDQ
	kLvdJV92lLV1zozovHnyR1TCsSq89q49lgLrJVCQ+FfSM33+16vpBZKYdFTxZlNuaXppotl+2kU
	ZLSo59VqHhBT5QIf1SnUOVizQ8KUGtFhep99Pq2FieQo7iEESr+/6hXN1Sj1504Y2Lw==
X-Received: by 2002:a17:90b:562e:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-38dc761b1f9mr8969549a91.1.1783959352989;
        Mon, 13 Jul 2026 09:15:52 -0700 (PDT)
X-Received: by 2002:a17:90b:562e:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-38dc761b1f9mr8969522a91.1.1783959352497;
        Mon, 13 Jul 2026 09:15:52 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118389d9bcsm60877039eec.20.2026.07.13.09.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:15:51 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath: Correctly copy the hint BSSID in
 WMI scan request
Date: Mon, 13 Jul 2026 09:15:48 -0700
Message-Id: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQPVWoC/6XOQQrCMBAF0KtI1qY0EZvoynuIhDSZ2EGbaiZWp
 fTuhq5d6Wbg8+G/mRhBQiC2X00swYiEQyxBrFfMdTaegaMvmclaNrUSktvcCXkxzx4NQfSGnI2
 Gsk3ZuN7z1nreYcymJULPtdKNb712IexY2bwlCPhavCMrUzzCK7NTaTqkPKT38sgolv5HcxS85
 hulGre1WmoLh4Gouj/s1Q19X5WzgKP8C5EFUV61Mriw0aC/IPM8fwAmwidSYAEAAA==
X-Change-ID: 20260712-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-8786dbd8cff9
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: EafvxKM81UZdoYwHJ9fyViAKeZo2q0Xe
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a550f3a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=4LN_5y7tnHSoj7lUZi0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2OCBTYWx0ZWRfX4TJDKh/Dfsxt
 It5QI14KgH+INUL0xXaFZksKw3C6haN6G2+uz4nwAUJwqQXsPmttGMaDORkac8eB7nKQcI0Ej7d
 r/Hpgq3DKDyZo5qfWN65y0vKPtZxI1g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2OCBTYWx0ZWRfX9LqFWBgcFOy/
 n71VEFZOAbwr/CQipKnVX1KTqGaLQ7Pdx7UCuKje8fSL/DHtTE+38+VP9j9zbWLgQlAngQPxJZs
 bCtPCY5wi8SYe+ompQ0/NbW8Y7FsKowRiaNX7NzCaTKrSk0/utaoZj8iNw1dijkG8X4SQuow3dM
 qumUbBgBZ02uXa/GXzNn482O/b1uTwpBb1TDGyVNk/MEWK4ZaR7rVFPJsFT0lRAOwry3XbUsIyQ
 lCj7PLUUK5PuI2kOxhz40TWKxHlGlr/WsJiTWux/Dym1+PM9lQTMt7o50OeCb0VyhMM4Woi6hT9
 z4l/MlXQZd0HVrboUhaHUpDdGVAWMw6wbqRYVzR2rG+sCM4IvKhr0d1kUjLBT1CsO0Tu2ZUIsFS
 z5K5EsMVrmRYuB7UdcQpVgSM6dZVBSpbwVTMyWLA5Y0Bc9wQnGar8wsQ59E5sK7+w7gTTEZR+cf
 r1Jtw8Mja4+PIFZiBKw==
X-Proofpoint-GUID: EafvxKM81UZdoYwHJ9fyViAKeZo2q0Xe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_171557_818007_593EF1F9 
X-CRM114-Status: UNSURE (   9.15  )
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

Issue was reported in ath12k, but exists in ath11k as well.

---
Jeff Johnson (2):
      wifi: ath12k: Correctly copy the hint BSSID in WMI scan request
      wifi: ath11k: Correctly copy the hint BSSID in WMI scan request

 drivers/net/wireless/ath/ath11k/wmi.c | 4 ++--
 drivers/net/wireless/ath/ath12k/wmi.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: fa1b1469f1c5f0f54ed9dab80106a117e7736bfd
change-id: 20260712-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-8786dbd8cff9



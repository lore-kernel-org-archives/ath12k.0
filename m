Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE83CA6007
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J03fkmpeEz5ye7BuQP2h4h49EgLI3UnhSBSUqTVuQxg=; b=bsbSCf73WGvOaU29cS9PQgyZn/
	y4Tt0/9wn/hqIPt62n3RDW3aPJywWr8ixK7baeWIphlXoWkC6Bb00fdIVLbvd9A+Vna3EoILDk1zg
	fNipBbbwVIbezCUksXSnOnuDhbLwz3gUH1EV4Rb90kC0omUhGiI+2HCGI2BzCWq/+gaAdUnqjKuOm
	UoF1UYQWXqpTJzYmJdPWqm/Qcf19EbxKPRhf8BewUe1xwJ0zeK/fS9LfPr3esf3NqB3RdMYhwLs3E
	d0PNHLNTbZk2UoSa4l78PvGFPZIUw0PNJJxV/8cy26XmhRODkGPFuUrXV3d20bvk3MNPxyr3/PTrw
	C8yvsR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnz2-00000004Qb5-3Hjo;
	Thu, 08 Oct 2026 13:16:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnz0-00000004QaM-0VZG
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 13:16:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698CXJMI2763146
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 13:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J03fkmpeEz5ye7BuQP2h4h49EgLI3UnhSBSUqTVuQxg=; b=MfIe4L82uxjCUQaF
	8EUjNOFYVhu7RAZ4JhOwBGjkHX3rjrlheabaN7m/cnpeI2/6acpQoj2myhAl+8Nq
	hcrlrx0lGgXu6Z6FZbePDVJrmV1j9IHUqu4GZOcU0zwDoMSZf7HjbHDvpBn7z4Kr
	iU8hifPbtvg0d9jBEj7iFq3T7eNBH2zAn8NSIPGdrrpYPbXvmUIQJeOwY/JHogfC
	F7iA4duxX8mPwXh8zFEe8BT+v3AmuwZMILFblnZersNzLqEOfs62l9i2Zil0NGJ1
	i0n89+lJRMd2QH/DJSGViToFWuIN1bqyRxWiZ7qKfsGii3HRk37vIvcxfjo3xcdM
	lhOvFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kg576-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 13:16:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e46c120dfso584986285a.1
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 06:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465385; x=1792070185; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J03fkmpeEz5ye7BuQP2h4h49EgLI3UnhSBSUqTVuQxg=;
        b=gNvNUWV5//lcg/C5Oriv9cS1E0fe4HB0irDb5DUc+qSlB+l08COY/EBWaVp/8ooRFk
         kPpdHJnadM+qYHxw5YS0/dI1v/+nP53Uvo8UY/jgEQsfbVlgGRRrkZZaQLtxaUKhuVh8
         7l3QXrd6nVs+OMXsjWcmifWPQehi+qQzTaPe3IzdSmtCZX1fKZUFBQ6WCSzv2Euj/Wii
         qqh6taPCi2/ZHk920GY/13rC+3V7oRuUGHQ6MVpNg8hL6pcHlBT9a0/SlfewwZRm9j1Y
         CnXtwxktpCTibTncqFUuP9ZSSqPwonDaUz/6qUo0nT6MFkNSxoB+ckCcVQL0zCwmV66H
         GsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465385; x=1792070185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J03fkmpeEz5ye7BuQP2h4h49EgLI3UnhSBSUqTVuQxg=;
        b=SWjR61XaadMdNazJjfaGbba77DsdkHTpKLrP6aXDzQYFggauc39LbjSN9hP7+5jLY+
         JWGnV7ekRHcVzoiTYDggWnRTxm3VPNT//de5CIoKcXLrpCFumm4RfcKkUv/mw2h6Ojcr
         e+ALXjTTNvU3d4LgMoLnShds4LAEXNaC4zXFDhNf3Sc1J/uSPGitJLpOFak4NnHg3623
         v1+oliEDAVliUAd9RGAFKyg8MPpOiCztOz+mBBFW/nbaYbqEiI1sKrMm2hK6ZZzbEgLs
         2ki0Pk5U0I2uh+AxN9RhiiunvVOitEFPEoUsLH9y9eS6Y7FJWR2OSl3mJIqLJlLHW9py
         7syw==
X-Forwarded-Encrypted: i=1; AKwUvBzaculxfhAmalFjBCYNGMMg5bIKbWUz3ObzlGixTPGd4UqFtO8wh7PKKzMnn2XYexqIEW42Pi0=@lists.infradead.org
X-Gm-Message-State: AFuF++moyw4lujUAErE6ydCs2bl8/4KL0GrTQ+3/WjU9JDrDUz6pvkZX
	aYUIFvhdp6T7HYUEsZmV/3G3Oh97sWMLnLLVD1kF2QgV/B1vsG0wgDvfkluj9h9zFeOslpBMEfO
	vadeql0ndSNTPpf76OKXxsP4FYLh+JAqsLmHy67MZjfZtfJlx6ulRXwDwhsv0YeoI
X-Gm-Gg: AYBFou1lLnzWnaBUAszZ7jVQIW32WgoQyCrrzSE1PFuEJ/W21vIMY0/Zh+EBowpLEWx
	TW1/CBTkatZtzvRCma0cvr5tf0Uwt2ESwX96F26gaYA3She+d///EK5SrWflJ6c+pOKQiSEZzVf
	6i3I9+nON9VnltdZvMjhkBwoEIG7J8NXb10wQ/MMmFOQZS7KNLjgRCwf8kquNmrolFmFMIppIzj
	7O8tv0VXOIctpkplqDPbjlYQTRBzEwICZiJsFX1lKGhMAIB7YluDJl9PEY1euTawVt4nZy69nze
	A/DxiDh5u3WnWd4KJrpkr6OMCN7Zsc7ZcsN/3UALReVlYbd9PNYeCXJpBXmZ+Nhh1ur/GuWTDXu
	+/OurDX8ETqbaow==
X-Received: by 2002:a05:620a:254f:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93e9b78abdfmr1087522285a.45.1791465384346;
        Thu, 08 Oct 2026 06:16:24 -0700 (PDT)
X-Received: by 2002:a05:620a:254f:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93e9b78abdfmr1087510285a.45.1791465383581;
        Thu, 08 Oct 2026 06:16:23 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843cb261sm72311075e9.3.2026.10.08.06.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:16:21 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:15:58 +0200
Subject: [PATCH 1/3] wifi: ath12k: fix datapath lookup in
 ath12k_wifi7_dp_rx_process_err()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-ath12k-pp-v1-1-68f888cd7eec@oss.qualcomm.com>
References: <20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com>
In-Reply-To: <20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Ripan Deuri <quic_rdeuri@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: t9tnNpst2DelrHd-T68IoGU5jk7xY7yZ
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac797a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BLTNKAuSIvEH_jb1uykA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX88OmAqf5aLZs
 QhfK6NIGCNzG3RYDtBIwbpI5AKxJJcrw80TY6nm00Z9zLbprECGRo7aCR7TRn4it/OxtiutSCHv
 ys39yhyc/9sybok34520Ym/INR8EzpI=
X-Proofpoint-GUID: t9tnNpst2DelrHd-T68IoGU5jk7xY7yZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX3z0IEp6nMyhK
 OJNRlril7uAFnQjdSuHQ1Cy2e2+HVTn6S/9P3HmkFHys3O3mFtyr0XQ02ioTFt0tvbsbMFXv/CM
 L/8GSx/mg9JISzj7Ktbi0eG0r2BPPUFsWEpnxAj8w1Ftl3AOICe8c1uwDwheCORPNW1lZQYNo0d
 34BoO8cfpamXeAsDAfiddmGXjF8LNoaYSKgxRVZtOzDRxOfkqeN7LJS+x6hK+AoH2rPXt9Tt8cb
 Y0PTw5xHVxxEyZGiEaFdNcxC/vzq8GwDEiITplNSnSe6r685j/1KiTa0fvK0cBuNLjjsNGfaLGa
 D/fc0/zPhWFbMYZPPAHIfxGF2A8+w6zGsGIpxJFRQESkZ/t+QRDY/aBnUeLDA2FR0yRxMwmnqdx
 3YVK2B46c/d7jBxXpgMmhWKQRtuYu0JJa00qZdxdo6vb7QDFL17xZKlgrTCtvIc05dj7j8LcOdX
 pMnyR5eW5anwIOACkpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1011 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_061626_279066_2C790949 
X-CRM114-Status: GOOD (  13.88  )
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

ath12k_wifi7_dp_rx_process_err() resolves the per-pdev datapath with
ath12k_dp_to_pdev_dp(dp, pdev_idx), using the local 'dp', while
'pdev_idx' is computed from the owning 'partner_dp'. As dp_pdevs[] is
indexed per ath12k_dp, this picks the wrong pdev when the REO exception
descriptor was sourced by a partner device in a multi-device group.

The error is currently masked by the drop condition that only processes
same-device fragments (partner_dp->device_id == dp->device_id), but it
is still incorrect and would misbehave as soon as that restriction is
relaxed.

Look the pdev datapath up from partner_dp, as already done in the other
Rx processing paths.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Fixes: 9e0ee04f818f ("wifi: ath12k: Refactor data path pdev struct")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8..633cb91b9e5d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1536,7 +1536,7 @@ int ath12k_wifi7_dp_rx_process_err(struct ath12k_dp *dp, struct napi_struct *nap
 
 		rcu_read_lock();
 
-		dp_pdev = ath12k_dp_to_pdev_dp(dp, pdev_idx);
+		dp_pdev = ath12k_dp_to_pdev_dp(partner_dp, pdev_idx);
 		if (!dp_pdev) {
 			rcu_read_unlock();
 			continue;

-- 
2.56.0



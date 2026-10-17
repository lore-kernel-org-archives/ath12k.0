Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B789BCCF2C9
	for <ath12k@archiver.kernel.org>; Sat, 17 Oct 2026 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SLe6j/uu4SB0mKL9uRRQMbHkYnjpRPV7iqxGnvaN6qA=; b=qzEySza3iT/oFAzK0X6eQtLbcI
	+gfZChWPTfUXYaITZbg9evExUwKP9qVvmWxiX2VdZ2NleoOxlTJjT/iSTsX5IEvjW+VASqE7Ocwm8
	cIBBG51F2fkFHjTHZlSQ0vvYCN0ZPA8WQpajS54dWNrXK+HQTj0/mCLf2EIm1aBc+28zz5+6Q0Su2
	5vTlcOD0llk68Xu8HufB2yrjxRNNX/Om/VKrAWnYv64WVZKGxypUeS6qfqJWDJhhxez6OuojVJ6S+
	NQUiaaDSnMatispT3XccRP41nQxGdXxNCQtouQynST0pWDgXfy/b2WNyt/7Mhpi5LFEp3pyJf3H0i
	uUtlxDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0qT-00000004cqP-26sm;
	Sat, 17 Oct 2026 09:36:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0qQ-00000004cq4-1rtk
	for ath12k@lists.infradead.org;
	Sat, 17 Oct 2026 09:36:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6ohVt3086171
	for <ath12k@lists.infradead.org>; Sat, 17 Oct 2026 09:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SLe6j/uu4SB0mKL9uRRQMb
	HkYnjpRPV7iqxGnvaN6qA=; b=kzxG+YvjgTbk6mfmbeMasthbCpIX8IKBoaudIP
	EUCBDMRXglz8OiwzkYMB6DMXzLV42r7NuNd2w7cKMG+RYaA1hmvSIYqpPcH6aspO
	FZFsW5sQY8vIyd+TfQzSKFOI6kR+L4J8vZTKVixJ/4Hz+5ti5zISj9KBZ+Z1BRVK
	n6pJSjQv+b/DnwoUKCxUbP8e7jZ1K6HMqqQxMFXhmm7uanleWHN5iKzz1DoTUeev
	hgFpd2D23BpRLbuAbPk3bJ273mEKA8ZtJQsoNevxcRKB8JjzFmmRyb8GmTjQE4bY
	6F+u59WWNfawFeLzNS1X+oiyGU2LgIBA64mFucOTZ3o+1d+A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k0fwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 17 Oct 2026 09:36:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917bab67568so23960006d6.1
        for <ath12k@lists.infradead.org>; Sat, 17 Oct 2026 02:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792229809; x=1792834609; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SLe6j/uu4SB0mKL9uRRQMbHkYnjpRPV7iqxGnvaN6qA=;
        b=YbAz8OOW8+WAH8dumStx2CEOYRgGz7IbIViSUa/rNoBxoMBWWApjqzohNTyQ8GN7AJ
         tFWsCMowNJYBZ1mQ8d9/XHwCa9pS/JVVsjPZGiK/WENCCInOVP7Kzsh61oE3VhnRSJUX
         QUXmWTM5EiolmP2womAezalI3cm/SltAY2q2dAKazPreJtdmxVEWQbvcDsPlSwXps441
         jrj2sKGGlItX4DN2ohxvtK0XgGHAMvjSKta85KAzB05Cy+zNVbTgfvG8pMnIHpiksFA6
         tJvvywHXkuadGGLdSTUYMDJR36eqRzluEmagSEpUuUkXw6pSTTg9ZLhQxphD77FSc1Ok
         WZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792229809; x=1792834609;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SLe6j/uu4SB0mKL9uRRQMbHkYnjpRPV7iqxGnvaN6qA=;
        b=h0j12EWEm77R6q4Iaqf7LE/tm6Hxx2DcOF6dOPVcBz1JLBPb5T/RHF37YTmbTtjocP
         NOH1Ib9BsxsrqkF3/OGWD3wmSM0B2pNYIYWTMvy+5P/EVM9OSsXwobTVt61nxzgeL/SW
         RPcmXF/+aYf5OYFzXuqaoz2+FOtbgbvL/0fmYQidafthPLTd6XXgAQKqvs8MkaP4ENCq
         ohRV1rtcozblYtMMx6lUUwP/UsQil6Mmkg1D6IBg2yWGVDRYl3G9NpnQdv9ld+kawGHs
         JG8VoAKNm6v11FH9QATW6fTq7x951BReH/m5MTppBQmfBdJYuezNgCntCIIhbc23TIin
         rxVg==
X-Forwarded-Encrypted: i=1; AKwUvBxsgBpP/LqpVUZ/ZaRiI9CEhL2PgjTbEx4jKEooFJsmBYv2O6mOy5KVo30/2JM9RKiG9CILZhU=@lists.infradead.org
X-Gm-Message-State: AFq9FYJi30apirLMomCyiJOB8jxhpls+i+adH9+l4AQsc1eI9OWuUVfS
	rLo8z72fU1DSOzppXSqGxR2lgsTJMKHQmeBef0BcXYB5YK88XZAPW6w6OUt0BhSJD3WKMp8orNa
	92uXOVYWmqh7sKsraYOsJKrJ/KHYg83NYWFcLgG1LHXYhPGVURc6CXiC5SoDAqISkpw+z+Sl8
X-Gm-Gg: AYBFou3aAPyYdpA+IFhivma/+lhMDWUc+FejbzBcRuuJJpvf96vpMT+L31CRbVn675O
	odPAjZxBW+ex9vOABXRrFd+HzWrY9CEWJhA4D98Dd8w5xcXvH2YekcBxwaBfC0dqtr881cySBUr
	9ZbrbP/0DRxgKh1xYmzuuKvKXMpgirAKU/kCuZWDffpxa5OF9xTs4L/XY9lk92T+yKoI6JbXedD
	6ixro/+QSzoQF4j7bgn1975OOtLNljfLOmzjOUIvH2ILRFbQInUpE5ZQm2GmWTs7S51GMwD8ohY
	6KsoTifb/5VqELTAxx8nzyUzrxkGdL1T/S1dP0QXRJAHf3eJicUflFKNKEW3nxxkkEI8reCxiSs
	8Vr1fyjMfDTc8Iw==
X-Received: by 2002:a05:620a:3942:b0:93e:c12c:f148 with SMTP id af79cd13be357-93f29e221cfmr362688885a.82.1792229808468;
        Sat, 17 Oct 2026 02:36:48 -0700 (PDT)
X-Received: by 2002:a05:620a:3942:b0:93e:c12c:f148 with SMTP id af79cd13be357-93f29e221cfmr362686885a.82.1792229807911;
        Sat, 17 Oct 2026 02:36:47 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50ae5esm10830470f8f.51.2026.10.17.02.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:36:46 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 11:36:28 +0200
Subject: [PATCH ath-current] wifi: ath12k: fix DP used for WBM error buffer
 refill
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-ath12k_wifi7_dp_rx_process_wbm_err-fix-dp-replenish-v1-1-21eff2270080@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2N0QrCMAwAf2Xk2cDagUV/RaTMNrVB7UqyucHYv
 1t8PDjudlASJoVrt4PQl5Wn0sCcOgh5LE9Cjo3B9vZseuNwnLOxL79yYudj9bL5KlMgVb8+Pp5
 EMPGGsaJQfVNhzWiDo2AvQxocQStXoeb8rzdoQQyLCJUZ7sfxA+8mUXKSAAAA
X-Change-ID: 20261017-ath12k_wifi7_dp_rx_process_wbm_err-fix-dp-replenish-2c7ec293f37e
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX1tVKTD/KsOyn
 vqjmmsMUshIL7nVZZs9dEMDxB/qqftfLWORDHwejjz4Tun1tRC+FJu7echYYzEZHkGqt9Zh63r0
 s3QuoOWctQV1VSbcbE1KXXOHB/RYlje12r+3TiA6x75R7EV9PY7QEZ9iV5qjZA4TADpUikLJCe/
 tLx4Q9qV7WuEHeSiE57V+DtOD4JqoMclmVhfIhDcp8+E/MhMDUaPO6z52BvIxX6/YMfXSsEII8E
 YlgUcxiVrltJEqe90TOPHWbXbl0WNfR7SSk1pso9sGZIVtbJMu+j22Jpqg+3vbnjjegj75cLrwd
 rKo+SwTYfjKqt6+8F2Wz95ZOoQroqQ69sf0pSFuinR7SAdCAT21GAFgRX3ZjpCTeaAwWlf1lU1p
 wZp38ncU6tpj7aGsgF+HjbXmo+VJ+RYTOCLxKp/kss7yXmme3SJvUaSfAs7rhABxM+mha1GbmqD
 TlL+JeEZrrc0WobCNaQ==
X-Proofpoint-GUID: xuQnOeRRdHjVZbHObx6xY1voXJ0VeRHB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfXzG/qHrVpL1Ol
 Ks0zJ3NlK0Bynm9Y7y5RFF399bQDdkonrQGssaz9qKW1XUOctpoE0nmCf/I6gYCJ3VahpY+RTMl
 d/m8FK/nRoz8DFnnJctcsbjyN37mQgU=
X-Proofpoint-ORIG-GUID: xuQnOeRRdHjVZbHObx6xY1voXJ0VeRHB
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad341b1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=d7p5rZZzYc0moGUifpcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_023650_495116_3F395792 
X-CRM114-Status: GOOD (  11.24  )
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

ath12k_wifi7_dp_rx_process_wbm_err() replenishes RX buffers belonging to a
partner device, but passes the current device's DP object while using the
partner device's refill ring. This can map replacement buffers with the
wrong DMA device and access the wrong RX descriptor state in multi-device
setups. Use the partner device's DP object consistently when replenishing
its RX buffers.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 1d18b197bc4b ("wifi: ath12k: add partner device buffer support in receive data path")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 95d87dd67872..c3e4ec0ac281 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -2052,7 +2052,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		rx_ring = &partner_dp->rx_refill_buf_ring;
 
-		ath12k_dp_rx_bufs_replenish(dp, rx_ring,
+		ath12k_dp_rx_bufs_replenish(partner_dp, rx_ring,
 					    &rx_desc_used_list[device_id],
 					    num_buffs_reaped[device_id]);
 	}

---
base-commit: 08a3f02fea636e97a7422d1512f76dacdb5b0887
change-id: 20261017-ath12k_wifi7_dp_rx_process_wbm_err-fix-dp-replenish-2c7ec293f37e

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>



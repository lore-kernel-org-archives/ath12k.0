Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701D1CAC59A
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wv8vpmjMm6rlbYNScyvr5yh8ZGIpG+FYpzsqoJqddIE=; b=Z/fZrDuwJ8w6ZpmbeJuex34VJ9
	ywlO0l7zzgV/icS+0VEgyL4Nqm12SwXWG7BuDNj+f5FJ0AimIKB+WRGZ+UgUaAj456VRDtU6ZsNLi
	Fdhy6WQPO624blZlSIzLLG2p+popT+klenJeZkRLmS4hyqhZF0g+/3P8H6Z0NYvo7FKqhggZpxgzJ
	TlucxH6apvU6ejoBQe0ZByxDmAJmvtJg6zxSj1zvb7xZZY5vqSejQm545srlOshW5PN6RUmLgNrwS
	X76AB70MJlPboLfsFa7YJxAgQ48UHsFGxEYa65Axt+TVMvi+ooD5z4JiFgugR8so+oh8+KUD1flcv
	/fekEQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLX-00000001Rk1-0uOU;
	Thu, 18 Sep 2025 23:47:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLT-00000001Ri0-3nAi
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IIRYve029493
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wv8vpmjMm6rlbYNScyvr5yh8ZGIpG+FYpzsqoJqddIE=; b=ij3A0EKxVSO028dD
	j9dIDXJNoYe7omwIXAPq04IQkE7/TFqsoqCXwU7vJ/NLjoy1+vTZ9Dqun+qb3MO1
	aRg2iYkcoVAl8TgPhdw++Ndaiw+thvdL6qMHQYu4RYZ3lGMACeZsvE/UOaSl+gvM
	kgR+vDftFa+3Aw5S3F5gSXU9WOwatq9BdCm0tbpR1wZXTL4yVQCjHGSQg5/4ZGnq
	IayJgZy8GQ1O0ZcOEoveRh2szF9VzL3neBkomJ1HaT3560j/oYvCEC5GknLSTzeD
	0fDiuwybOekqbkwXAS4EQ2ZlvK/ym9jDRx5OZSu5asr4pXeme3MEgYogM7u74fWP
	/lyn7A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy10bfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ea7fcddd8so3073205a91.3
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239242; x=1758844042;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wv8vpmjMm6rlbYNScyvr5yh8ZGIpG+FYpzsqoJqddIE=;
        b=Kx0x1cSXxsx1pEejobUtLbzGXuNOOT+8kZ9iuJMghDHXjCc50p8YOBGFVP+dS59r/R
         NmgBs1drq6yYADNzyxhmVOl1KPjxsi4gn1Kq1qu/GDfSAtnZEqaAtSC6N4hKF8lz4fcn
         FIU5RzYoCDrbYrXC7SsB47aAUfR35aAx8e1xzhLGwVV6L8r+JYu0D68EV84+ow0wrEcA
         cOSDhzWAlLQo+Y5I/8+t8xgscriWwaPQFdIy/KNOBGqIQ25X0ATAS0Ucj4NzLXm6QCGm
         frOwrlitdFUvxBwgO9hpWkloYBMB9mvBYuL1JXiv79GQ9nGUdpDd8wj2BQt9VOIlF2wf
         fe8g==
X-Gm-Message-State: AOJu0YxF35/wvw9b+1G/FP4UZMQXk6pgUQNpq/QTwj7fYZtf5bLSDezr
	kFZNQempG9JhGz1YnFZP5dmHKTq35kJj+/OamXWkGKcEzGnvHZivs16+6jydN0J1NKK5uArrNPJ
	nWWK3cYONROy7EOmaNu8KNGIMwALUeeV0lGkoa32p8jL1IlkvU60hDrNxtNEsMqLT
X-Gm-Gg: ASbGncvakPDnzJSXG1/S7xPJ5KdXwnwVhEuc8KI8odYB2UOEDHk3y3lRzqmd3RWDdb4
	1R/5Zs3anfmxM+HTD2dqbQhsmi9a0WRyq77YFHS2tKDsFV50lDLeRwlKfdU2ilxm5vs0MVHocuu
	NTKahRpsnak4JR9a5Q0tE8CpPRVqwelfwK15h3bm82OlHs4ISlxGGIfUVwtmucX9+9RkMe3lpWg
	ufFrHr/NhGLiogworpgRiDVzTVRDG4VmWqzfbo1mHVGlEJY+xtnuVeoxgJHlU9LWnBKkVpnV+xP
	fI6kN6wtOypCS1p1oDPffhAhoE1TvN/+85iyrSa4PmB4dkYe9X2qrBnfRsiJ/iDfH7C2WoG6ZPf
	3
X-Received: by 2002:a17:902:e741:b0:24c:d0b3:3b19 with SMTP id d9443c01a7336-269ba55f952mr19918275ad.56.1758239242223;
        Thu, 18 Sep 2025 16:47:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyxK8bH7q/0zfeiIWmwMZKcxlg0yck4JvXJAIklWaQwJF4KdSNcnI+LaCqe7oKrgTbB3s+qw==
X-Received: by 2002:a17:902:e741:b0:24c:d0b3:3b19 with SMTP id d9443c01a7336-269ba55f952mr19917985ad.56.1758239241830;
        Thu, 18 Sep 2025 16:47:21 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:21 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>,
        Vinith Kumar R <quic_vinithku@quicinc.com>
In-Reply-To: <20250723190651.699828-1-aishwarya.r@oss.qualcomm.com>
References: <20250723190651.699828-1-aishwarya.r@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Add fallback for invalid
 channel number in PHY metadata
Message-Id: <175823924111.3217488.5312521302210804871.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 08dWUfJTh1GdjgpbLMENG4Shbph0rRuE
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cc9a0b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RSXUyCpSUqS4h5l59n0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 08dWUfJTh1GdjgpbLMENG4Shbph0rRuE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX6s5cGKs1iRSb
 UGte+29k4o/8TVW2/Sn6uSqAMNI++riKQDlvOglfNlteK77Lprm+RO4BCOD3BPUZyNd9Hby9dJw
 FimtJBZc0S928qaV7y0iYtGaUhx1I8QMZ69B1ad9KvhYiuGd63/C2AiAAisCjWd3neloQ/GX2Pc
 dwWIMjq7UzV97msuOjbSBw5kv69RLY4iLvTIlxvNeVK4sAgJGqHilFopDHx4FkVCspvBRNxTuxO
 23AabNcJHVhLVPNEdjDO90/7Hk3e8eruTISnNDNz+jcN0buZ3RQG5gNQe/Ldbt0DxToviEshpse
 HPI7by8C/FSBJdgGUlp9YT0QMOMcwRUi0upRWbg/r0Tf6xhA5lRCpnSvMTE+2qA/kPxayLHQsnA
 MJLwdjJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164723_947377_48AD66B3 
X-CRM114-Status: UNSURE (   9.42  )
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


On Thu, 24 Jul 2025 00:36:51 +0530, Aishwarya R wrote:
> Currently, ath12k_dp_rx_h_ppdu() determines the band and frequency
> based on the channel number and center frequency from the RX descriptor's
> PHY metadata. However, in rare cases, it is observed that frequency
> retrieved from the metadata may be invalid or unexpected especially for
> 6 GHz frames.
> This can result in a NULL sband, which prevents proper frequency assignment
> in rx_status and potentially leading to incorrect RX packet classification.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add fallback for invalid channel number in PHY metadata
      commit: 26f8fc0b24fd1a9dba1000bc9b5f2b199b7775a0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



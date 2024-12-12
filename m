Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9C5E77180
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzswdAFjVrqJvldlRJqWNRKWxFcLJfY7sUUkJQQ3o3A=; b=L1OAJkN5fc/bR8cq+q755WeFej
	FawHvE6eT21AletzzPaFtBgqJhbvO7AfHe+SOV1RAn8rBybPP56+pHcR9nuH2efZGSezYtvXSahCa
	hzFtX3S0jLnp2/haByOdCPx7Q6gEMyilQ2kqy1sW8VZFd2fhI2hxzuzo7yG7BkKUdqB/v7fUnkGnE
	1QbKDNET+h5nut7qkz+qHzphTX0elcmxV9c3xSVCHgNbUlrcZUxUeme6Zeis/xV8NMwU+BQZUPcMz
	1w1feo/c84SvWHeDCj5XOHlVFlZAcaQN6qPD379CcQ7V2q9Y/iMuXa5yMY71VbxBdrYPQzDg9hKke
	VSVFRDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofV-00000001aMo-1lnN
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 19:16:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnwU-00000001QPe-2wNo
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 18:29:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHDTt5032125
	for <ath12k@lists.infradead.org>; Thu, 12 Dec 2024 18:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzswdAFjVrqJvldlRJqWNRKWxFcLJfY7sUUkJQQ3o3A=; b=bWM6kTxKVXOehTU6
	FfKe1i4Z0YU1BN9LvjfNCQE++Q9PZkqDfL649s6AK2cIomOirdRpjI6Thr+ARhqG
	6CUxXshq4cyV7Q0bY6tVtaKjHgdFymZ9afgGHHsxMsSvS1ba+to5pJeCiZv5Mp8j
	k0YYl9orJT5uMNwjsnowMQecnKNbkIarl9QMUlVj2czE2Y/s68/9qQ0uCtN/zu9+
	88RUSWq8bYz7YTU9UIGEfUfaq3dKwBpHhSbdLKknKWlcBwgKSWruDJy/qK8QuYSg
	mGSJJ9/CihN2boGagxycVleX0YtaS6whuI6CSGvnkjcm1kemC0VWRn17Zy8hdj/X
	DiR6/w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfd52h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Dec 2024 18:29:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef9e4c5343so1300573a91.0
        for <ath12k@lists.infradead.org>; Thu, 12 Dec 2024 10:29:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028181; x=1734632981;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzswdAFjVrqJvldlRJqWNRKWxFcLJfY7sUUkJQQ3o3A=;
        b=n1cVstNvMtEhcHoHkLtJJpWgrFckOT7LvWNxhydZKfrna+7G4mNLnLxVmf2+TG8iEP
         AJImmk/+IL9coMjUADx4vDUCxEbsYqJf+SRxSux6/7fbbgvQ5etLjHO9CBtwwaJRd+gq
         MdcppG91LIICjwJKh6+n31kAYLpgqrc37lmV+XL9p7tzRRjL4dlLDQrui/JxQSxKaENu
         VaivlmNfyhbBMx0llJe3O3GiAeyR43NbtgNgoudj+DCdirqFWsd6mPH5+Li2fqkgqTo1
         9KbYJZeFsVNOUIesELYxBqQH2LBTRF3HttPNHf76TxnsrQzgGTSs7Eb3MFb4BL67hyRE
         X8Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+aWj78pQi40F+3SvGNg9FgDmJOHr8k7PSDgj1XKJmjYO9smrvmMfNqTRDOV/46npnxv+0zk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ5GLw3dSamqspjqy9JaJpgBJOr9JOmmxYjiVXlGQq7K7nolcb
	cE4ujZoxT4Gf+YYEGCSaqjSTT7yCziKSdIDuXFhEQD885hzOvucgb952BHbJtKwBnBMqqPo8/g1
	ZVGlROPKGdbGPHZHV7f7YQUk6nrRx2rw5CYeT8oIiezcC5hKF89m1mxVvPK9X
X-Gm-Gg: ASbGnctGLmyPd71CKOW1CnGLquWkPpxTWPwbM1XcykBZK5ZBH9IDs16jPfj8sKwDcA0
	bWyCHsbbOvqZEYczoQr1NXcDDoN0EVGSTHzXzacb/5l6SyPszf4eBq5mIom1kAdXvf5bh7PANbj
	1yIKclo6dad2zcZ1R3VCeZhC5yXzPXOp7ys8TFnZ3R4wA3VExDbAGg0F4Y0jM63zgnZeTQrO/3P
	CPyx8ikPuj+QUaD4XX5+MkM2k+QWiuDcTMtAXE5LmWjx4yUaiErZMeZGyWZb0p0OeeBD6rx0c0d
	G+GqbMJ4xOQ8sIIIEg==
X-Received: by 2002:a17:90b:38c5:b0:2ee:d63f:d77 with SMTP id 98e67ed59e1d1-2f127fc3496mr12114326a91.9.1734028180668;
        Thu, 12 Dec 2024 10:29:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVDA8sr7q5zN1fFeIX1o3inlsqd30324L+nbP5r2EPGB3X9jSPZoKl8YtTaB7X2YJ9Vlh0hA==
X-Received: by 2002:a17:90b:38c5:b0:2ee:d63f:d77 with SMTP id 98e67ed59e1d1-2f127fc3496mr12114295a91.9.1734028180289;
        Thu, 12 Dec 2024 10:29:40 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2178db5b435sm16480085ad.208.2024.12.12.10.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:29:39 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20241210-read_after_free-v1-1-969f69c7d66c@quicinc.com>
References: <20241210-read_after_free-v1-1-969f69c7d66c@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: fix read pointer after free in
 ath12k_mac_assign_vif_to_vdev()
Message-Id: <173402817940.3419904.18252047613958190039.b4-ty@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 10:29:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: ht5YWwWvrkMsFYxVZnkThFAdJg_FNuQ3
X-Proofpoint-ORIG-GUID: ht5YWwWvrkMsFYxVZnkThFAdJg_FNuQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=647 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_102942_749376_49F73E53 
X-CRM114-Status: GOOD (  10.36  )
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


On Tue, 10 Dec 2024 10:56:33 +0530, Aditya Kumar Singh wrote:
> In ath12k_mac_assign_vif_to_vdev(), if arvif is created on a different
> radio, it gets deleted from that radio through a call to
> ath12k_mac_unassign_link_vif(). This action frees the arvif pointer.
> Subsequently, there is a check involving arvif, which will result in a
> read-after-free scenario.
> 
> Fix this by moving this check after arvif is again assigned via call to
> ath12k_mac_assign_link_vif().
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix read pointer after free in ath12k_mac_assign_vif_to_vdev()
      commit: 5a10971c7645a95f5d5dc23c26fbac4bf61801d0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325DAE7718C
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 18:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VA7tV2ui67rX61THZ5+FlVRr7eM0epEaxOyh5+LbLho=; b=k2lCT2fW2GVpmuyjDGkwzia5+g
	YBvkeBVbPVNfdzpIlUdFEkzk+THJtbFYgBzrq0v8ENrpDfG9u+DrfC2YsdAM34s+EtaMmKWyy/xfS
	/Sxa/Gap08h7VS9V/cU9ca1GMzF7q6IDbz7PfJ9XLA4KP+4sfbxQgky5E+UNzwr69LU8pGi3DV/bS
	vOskpVJWyAl13+YL1vH7daGBDVJxIPH0ifgiZeAlLuXpVeVh+sTUO7vLWqaxuC2nKms3Hk8LUCTyG
	161+ur1ptj2D0wYkkFqaTmX7Ag6qaHBcUVpH+dJP4iQCWF356/3iqZf5J3XDvkCrDr1t8T0lMSbU3
	Or4j58Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKvj-00000002gsn-41Xj
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 18:07:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKjj-00000002e8V-001M
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 17:55:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGea9T004027
	for <ath12k@lists.infradead.org>; Thu, 19 Dec 2024 17:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VA7tV2ui67rX61THZ5+FlVRr7eM0epEaxOyh5+LbLho=; b=LeSb80QGhzC57pbQ
	vy0j2a0k9IR6erOWMy0LMyZSYm/pcNB5JyhRgokuipyW5VUh56ghcmmuoRmMWGVJ
	aRkhtGgUC9iv+Pwsz4sOEdl/OmOL8yqvlesQHe8JP7E19Ok24zelaiLv1GlJS0EJ
	AReBmd1aLV3VtYrs047hbM3zLpFoJDf3kUGgOX0U2rZ8y64kK2m0g2Kpo2ACcgHm
	tyq+VL15c0brZl2tPWSi1ZMhfEFW772Ma7ZFiVDqwg3u6pn5NrEfNp6KxiG82h7F
	VxiQ1CAY5uDq2PYcMrGJqIBWSj1NnBxa9Yt5Q47QYwCswr4L+4/hbA3iKNoA+1p9
	jLaQvQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mq7fr6hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Dec 2024 17:54:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef9e4c5343so1409556a91.0
        for <ath12k@lists.infradead.org>; Thu, 19 Dec 2024 09:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734630896; x=1735235696;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VA7tV2ui67rX61THZ5+FlVRr7eM0epEaxOyh5+LbLho=;
        b=OAO5wPPoBpPaFfkqKBodCxcPJPUW5Q4tl8W4CWiAzQYQc9gKakRNWddql2ANMxIdOo
         kY1z9UJfE5k8JQQIioyVK6PrSVjqB2KKztcnrg9i3mkJdaCSjIvSx6DQt5JYawENAKbi
         A4/cTe1y5XoX1d74OtyQWpLIo7YTqcGrpcPGx/pELQaUTVjBGLLYMKAOyvjnz9+2x/AD
         N/CAYc8CA+7pPl811S6IDOCOqoX4ZdMi7QikQTdEOjzoBrrJNHgpAZumc1Qm9PlhRATV
         T97bedV40ENx3+7zztnACbPHKX4Pb2lIfdwIHCSYVWrB//BzjDg6c+3A4axGTOqo+krj
         LTvA==
X-Forwarded-Encrypted: i=1; AJvYcCVmpJrpKwRL/DmUDokb2a3axkBH0j0WpWePXGnaHWC2YvMiYFbYGKvAKWaq7cdvUt3r7SS2kG4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNwOpVgrf2KwhJR/C6tsSMRrgCuocu7RSKMXm2XcR/CEgj55ah
	FPasVkB4IGbZexUnUxc16ctc4Zf0jxsZFgzM1q21xiBwhQOuQsPLX0bRO5es+WkLgzkUa8QMSJH
	lNbrv215TiJ9aDdV/1bhISTae0NHdxx+8/aiLGFRBCLO+tOU4Vnb5UwBkDNuu
X-Gm-Gg: ASbGncuEnIPKRRegMNQWz0GqdDvNg2JOMC3POT+tUx727YbLDaiqoFS4bF9SDBrTdC/
	OTvnSuFIil6lZUdzwUc3UFFD1NexCS4B5bWgJgYYA910wEQQ3SEywOemeQ+tT09KQtO60GFX6fp
	KW0sPm2oxsVPnqFk6EhJziBEpX0REO7jrb6cKu2kjQI14oWH7kIPPM5UuytGO24BeyCnWh31lzs
	9gbiYRoogCeLXeOz7s7MiZHgVwH5eAwty1QWR2kI0gg1tyi20U6wup40iUySlPQN0cTGlQW0UGi
	JdWIs16yd1c5BUkedA==
X-Received: by 2002:a17:90b:50cf:b0:2ee:f1e3:fd21 with SMTP id 98e67ed59e1d1-2f443d454a8mr5966926a91.25.1734630896234;
        Thu, 19 Dec 2024 09:54:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELG3UMWl1CbADJmhXEaU2YZ7TC+6nbgzolRNVUIHmnFsQx0hXG9D4OQTIDGnY8nNs8qGa/+w==
X-Received: by 2002:a17:90b:50cf:b0:2ee:f1e3:fd21 with SMTP id 98e67ed59e1d1-2f443d454a8mr5966895a91.25.1734630895835;
        Thu, 19 Dec 2024 09:54:55 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26fdfdsm3630628a91.52.2024.12.19.09.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 09:54:55 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241217105505.306047-1-colin.i.king@gmail.com>
References: <20241217105505.306047-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] wifi: ath12k: Fix spelling mistake "requestted"
 -> "requested"
Message-Id: <173463089453.2609009.334897453986903182.b4-ty@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 09:54:54 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: Kma_w3uHfigrQjiHYF0EkPl5rTbKsrzk
X-Proofpoint-ORIG-GUID: Kma_w3uHfigrQjiHYF0EkPl5rTbKsrzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_095459_158594_F44A9FD5 
X-CRM114-Status: UNSURE (   8.27  )
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


On Tue, 17 Dec 2024 10:55:05 +0000, Colin Ian King wrote:
> There is a spelling mistake in an ath12k_err error message. Fix it.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Fix spelling mistake "requestted" -> "requested"
      commit: 578f6fc55c2ced5f68a7f87edbf6db3663dc6b57

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



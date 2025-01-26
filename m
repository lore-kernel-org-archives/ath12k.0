Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F783C02181
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 18:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgY+/s28TKm8p+bojgsh6n3sGw4PHtPdS4xv23k5Hpk=; b=157Sij3LcIYRTgxQbUZfET6Y8E
	PBh3iMwVjl8DYcBzWQCE6YVhudJ/vUs7HVV6tUcJFQspYVXwUMSk6h/4jaPXQSz8LKXlnejzCAEZJ
	FKkXDgVQlxjUa5ytHik4a/jMJBRPIFnBx2sbYZwrML9SKV6F1ElTGIpI3VK4AOmFBevuvA+5vkTfI
	DiCfkiS9xFoFzy1lBkFp8joZtyApSFaHRO/E5vUuzXhUxM8w63JQDCc29aGiEH6WSOVoDlGdMeqjW
	Jt3y+2Qzzlk5+IsBt0zsLPu85l4eTg66b4/e3L5Dd3P7fKplGjKEGpzp0KgE+PMdsbFe1ECP4nEX2
	FEFkdLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d3-00000000esi-0J25
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 18:45:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d0-00000000epp-3nLK
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 18:45:04 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QHSH8t002264
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgY+/s28TKm8p+bojgsh6n3sGw4PHtPdS4xv23k5Hpk=; b=ZzYpvTS70UjVGww4
	UxOIa8JnymnHrKVlPrRFah2h84ezPWJtTbiHHZnsMfgtMUOdEsfejTbr+Jeg4nV8
	u7btmA0+cGmZMtsk3UJX7ssdY1s9xA9Cnd6isPWvIotrA8USkCTfcPulk1bcp2hp
	ycXV8Rf4mv5dKLApq/3reXiA0KdOjR1OQBSVWJQUz/1aVOU6lEOSXGJu4qXS2ojb
	Ho8PxrGcvvKBwuNc1UX4+GI7gwIrAvFDnRBptL/0UGofnNn45shv5auPlsrZIM3d
	33ThpNkOaScrl9hzOj1DO1kfFhOWdYUBE6IArAGwnE4T1qVA2SsU8rvRvarxuHAc
	wgs2vQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs4jt5w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so6801467a91.0
        for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 10:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737917101; x=1738521901;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgY+/s28TKm8p+bojgsh6n3sGw4PHtPdS4xv23k5Hpk=;
        b=X59HxoeHft+RBFEt5NOtnXZkLCenUy6cI49NFRN1PStWkBMY+8Yo82nIksLDlE9cYk
         7wzgLriVkAjng5p3QZgN58P7TuCg2C5poD0CNprSt6oBxkRcB/+9g7XZO0pSia4mNZxp
         6b7rH9EkScogs1ZUNOMMyvKet5uBU4CKizxguKsq7/kCvL6hC7HGWOLooz5NvZ5rIZuz
         vmVCJ0QmtrP3IyMQ/cWskF2Bmep74TdoPM5tcmEfzY0+UqdSI6z9TE5ewdld6VtFOX4i
         ymyFua6t6UjJR6k+5XqZjvG7RAnFcJCHpGg4sDpr4tZYhSdldjAy2x0KwunqyFoK2p7v
         MLRg==
X-Gm-Message-State: AOJu0Yxqr1xHQ/uOlQkNlssbXq3hq75gpU9i9T7eBBCF5Jiu08zy7tnk
	4JyPYp1m/BCOQXCN1E8mI3iX2h5otGQzRc8fx3p1JsMfEKNcLP/H3I0h6N5Nt0YKzLwjCIxxr/P
	vHI7pjkMgYkShbo8YHwcywgWjubaHtB8Hp+xLdKYL03M4c5+x4ANE/TsR/RFHZZWvkopL
X-Gm-Gg: ASbGncsJOZGWszvhIx6CQJF7ZMGpYEGwotFUe0X9z4APxfQwE99u8f8/SiqjqEkGibq
	OMtAZBJ8qzZiB2a7pVWdtMrXYCQMfO+bA8TanWcB7og72ekz0lkyDnrLYmuQJBVkk1ZkuK3btmD
	IDgGkZr2oQUGBWtCpmDBFRFQ7zD4m2Dn2V6hqTlafXyky6Y2YsdSevKo64meBdQxW708wXvWTwO
	2jbzphVh147nNLWRNIv4Z/HqrEBj0ZJ3MU2DnD+kvDkny1klrE6mUz9uOeRXmTxZgrCing4Dj3n
	GBjiqhtvPJ66AkdNH3tu3a+qqMvri4mTT2MBd72ndg==
X-Received: by 2002:a17:90b:1f8e:b0:2ef:114d:7bf8 with SMTP id 98e67ed59e1d1-2f782c4ff33mr49493139a91.6.1737917100318;
        Sun, 26 Jan 2025 10:45:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3oAEzIzYvonxibX9+diJDX7rPGJxl3m/popd/TdiF+TVSE8ji9fLK99N0V+pwcHlbL585ZQ==
X-Received: by 2002:a17:90b:1f8e:b0:2ef:114d:7bf8 with SMTP id 98e67ed59e1d1-2f782c4ff33mr49493125a91.6.1737917099948;
        Sun, 26 Jan 2025 10:44:59 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa44cb8sm5414795a91.6.2025.01.26.10.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 10:44:59 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Lingbo Kong <quic_lingbok@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250115063537.35797-1-quic_lingbok@quicinc.com>
References: <20250115063537.35797-1-quic_lingbok@quicinc.com>
Subject: Re: [PATCH v10 0/3] wifi: ath12k: report station mode stats
Message-Id: <173791709932.2935553.18007437105924407173.b4-ty@oss.qualcomm.com>
Date: Sun, 26 Jan 2025 10:44:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: 0raYv7tdOjXshzIAMbRItrwF_nDuk7X6
X-Proofpoint-ORIG-GUID: 0raYv7tdOjXshzIAMbRItrwF_nDuk7X6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501260150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_104502_957228_DBDBD2E7 
X-CRM114-Status: UNSURE (   9.65  )
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


On Wed, 15 Jan 2025 14:35:34 +0800, Lingbo Kong wrote:
> Currently, the transmit rate, the receive rate and signal strength of "iw
> dev xxx station dump" always show an invalid value.
> 
> This is because ath12k has no logic to handle this relevant information.
> 
> To solve this issue, ath12k parses the information passed by the firmware
> and passes it to mac80211.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: report station mode transmit rate
      commit: 8a9c06b40882ebea45563059ddc5d57acdec9dda
[2/3] wifi: ath12k: report station mode receive rate for IEEE 802.11be
      commit: 5e73276c814fc1a5a1bce6be743e1a07baa6d4bc
[3/3] wifi: ath12k: report station mode signal strength
      commit: 79e7b04b5388c13290ae6d64f930b096c2f465c9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C659C02192
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 01:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yT5/fcAE26okMeBX/EB7E9oL6/XaBT9SZ0JtHj1hDks=; b=0wasrBs+u+y5cgstrfkPEht8EU
	hV5NJJVUjOfnfQcvCWH+mH2wxBDNiZ00gUu31q/FYru0MdHaHw2Q2p4v3efCrRV9NmqQKNKbPc4YF
	mQlpxiCaayLiizRmY8Nxde2n3aMnYFPTQXwYax7+oNi5WmE19SgrXZr80afdixew3CjGSxWpLqMpy
	UHTVL2ktqwnBFcPfjz1jBM2l/++rpPI5O06JkgfqyFjGRZCKJwEItv9SsayEVl/u9nQIgIRDxn/XE
	LCvOd4yeHj797FMLCu6x/qnSHzjUAWIws76FG7AkTENpe6dWBj3fzKEQ5a70SEzfoxmduvsFqn851
	dpF6UEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf7VS-0000000H1JZ-1DdI
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 01:13:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf7VP-0000000H1J1-0WXg
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 01:13:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513KQji8027024
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 01:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yT5/fcAE26okMeBX/EB7E9oL6/XaBT9SZ0JtHj1hDks=; b=Z74ujgkIJ1nofgbX
	JdhTBUlkFH8h30LQ7yeyQpeLIoLs9Q3QpxioAlBQkNEH1MvHDiVVU7S3BEjufWfc
	MD8Somtup+h+Y08PfdynIj+CKH7PKy646wMwR/jePf/Q+RoEBPudVLkZi9ZyBT6z
	R5Yoz6LibxK3sUuZ2bzGT5DDNDex62lBm9TV6P6DPjwU5k/ddNnNOTRqC/5KDMKI
	iygzNZsK2Z5m8QIv5+H+huu6vhqn7CvBwYEjbUhFYc3iKrVCAum/yQkP0m3myeJG
	RmRH500aOjZMNZX/BLVpG4wdA07MQtKvhMjtT9RewMG5wcTXysm66FveikHllQKV
	D/aN5w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k4ufrg5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 01:13:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2166f9f52fbso165279495ad.2
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 17:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738631613; x=1739236413;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yT5/fcAE26okMeBX/EB7E9oL6/XaBT9SZ0JtHj1hDks=;
        b=nNxC/VOflruBXl67mOxszOjoc2qW12CquXmWmA6URcOBWedijTPyCmZWD/QwsVZYut
         +kYt7EAsa30/moKb4xIG1ocxma415hd1sjKd/ZCoyKjs9AsGIagHx2IjCQxB0zBipwDQ
         apgPIyfIm8YYTau1bKPKDi59/ap2ffEMOah9L8SHWPf3xA1sUEfEhHkEKfNpEyorFQzP
         8zqjOENpaBIFhKHUHdZ1Vz67ipJZRvxBluWMdN1anynB2XJ2vm4NmoBNePqjS5A5JJMa
         f/6vYNnlo5EpwuIWNy0yzRFh5aGtf7wuQCzTm20z9+CnwilEDu8bxtzP/ly4q6zUp65w
         ixlQ==
X-Gm-Message-State: AOJu0YyY7LgNLNEsYliVFxocj6ZwjT/n0cw438P+PaqvXYzkRaGy4S7v
	qX/STwnLMzjZotH4SPttfRiFHFPsXhJiO3789AXzELB9Dn0wKDbrFqAVZDuviKNFIfj/2OBSLJ2
	tgCljunXD9advFAqM8m5hDqMLW1EY6emNd/qvcasG2sUe1wBKUQEXRJCXP5sQ
X-Gm-Gg: ASbGncsS27Kc1XuYEy7i1ptxOMfOwhkENboKYw0za0UEBatv7J9L3Gf5GTOzM5k5pjW
	sBqe8gCr83J2ID23sXjGppUv4rdsdtaaWe4RV/I0Ld9L0rT4eM7+IRbW9WZeX9A8dPXuIVcc36a
	CMyXJVBhjOU9Pt2Wnml0ufQKpui6QUBUVPju2fJgG4XQs3qLHTEpy65N4IChWHRnr6kRd3VmEMj
	1LrWbIp9meuoUTSr8GrLzqd8coHq5sxYJLo9e8uWwKFGin3iSgPzkMmHiHTAJ79GMILloBf10nv
	20yswVkC+//GkBgCSdgiC5ZpOkQJeG9X3DnBBwT8Yw==
X-Received: by 2002:a17:902:c40f:b0:216:281f:820d with SMTP id d9443c01a7336-21eddbf3371mr261750615ad.11.1738631613345;
        Mon, 03 Feb 2025 17:13:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsmFp4dHUN9/ea/YQYopKp1NpfKyinYyi+gwqb6hy52ez2R0RAtdQ+Fo6xTNuvyemLyBbDzQ==
X-Received: by 2002:a17:902:c40f:b0:216:281f:820d with SMTP id d9443c01a7336-21eddbf3371mr261750225ad.11.1738631612923;
        Mon, 03 Feb 2025 17:13:32 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f8522sm84069685ad.89.2025.02.03.17.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 17:13:32 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Lingbo Kong <quic_lingbok@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250113071758.19589-1-quic_lingbok@quicinc.com>
References: <20250113071758.19589-1-quic_lingbok@quicinc.com>
Subject: Re: [PATCH v4 0/3] wifi: ath12k: Support dump PDEV transmit and
 receive rate HTT stats
Message-Id: <173863161230.4031998.5854006886193521367.b4-ty@oss.qualcomm.com>
Date: Mon, 03 Feb 2025 17:13:32 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: P4vrzgbIpLfsh9pia6vqo9uJDHYaRD2O
X-Proofpoint-ORIG-GUID: P4vrzgbIpLfsh9pia6vqo9uJDHYaRD2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=682
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_171335_184223_33A643C0 
X-CRM114-Status: UNSURE (   9.44  )
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


On Mon, 13 Jan 2025 15:17:55 +0800, Lingbo Kong wrote:
> Support to dump PDEV transmit rate stats through HTT debugfs stats type 9.
> Support to dump PDEV receive rate stats through HTT debugfs stats type 10.
> Support to dump additional PDEV receive rate stats through HTT debugfs stats type 30.
> 
> v4:
> 1.used tab(s) to align the = to match the existing code
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: Dump PDEV transmit rate HTT stats
      commit: ba42b22aa336c3ea0bd6f9c606f70a35a278bd61
[2/3] wifi: ath12k: Dump PDEV receive rate HTT stats
      commit: a24cd7583003824f8bd0034c02987e5da26088f6
[3/3] wifi: ath12k: Dump additional PDEV receive rate HTT stats
      commit: 7a3e8eec8d183d7b293bfb69caab9f213e0a6bbd

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



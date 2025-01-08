Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E010DE77197
	for <ath12k@archiver.kernel.org>; Wed,  8 Jan 2025 00:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHZC506u+hUh7w0J0fibA9G0IOLoYOIzEU1XTx2nqU8=; b=bbIP7RMhtGImBR1nGR5nW2Bx0p
	4lIPDy7XFXN6QkqItcY9ddKp3UpBPRgowersBvXE43lFhWxYdRJH0PEE4Jg1Qpp4MAzkstDgIvPwD
	0A2h5criukNQqSjO2iuqPt939WCRI7NstuM8GJeDiFQL0Zccyo6IP2iFy/87V6RYcreVQ4pB+S/F3
	EThIYcs4m7H4DC2ttKY0Vlaqb/G8CKfH5VJhlL0mm5VbUjF3SLkC+h1O+zFkhFB6UYtzEeHSxylHV
	UjAnn8HoyBDktnXSFN9XycPi4/bG0Cuw1iM44cyEh8I1qZxfrr5lPxPaU7EW7BdAhNzhu52SbXceQ
	dZb9msbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJzr-00000006dOF-2bdm
	for ath12k@archiver.kernel.org;
	Wed, 08 Jan 2025 00:32:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJzo-00000006dMd-3A5f
	for ath12k@lists.infradead.org;
	Wed, 08 Jan 2025 00:32:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507Grins031829
	for <ath12k@lists.infradead.org>; Wed, 8 Jan 2025 00:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHZC506u+hUh7w0J0fibA9G0IOLoYOIzEU1XTx2nqU8=; b=TecTXHUFbUEbiI3i
	RiMZLN6Yy0GsVP+yAYfOrnfLzwpNDu0rAHKewes8tO+iwwd0JWdnyUNems/hsYSn
	+r/82Dav1S3WJjTmwtj7WO82uzLfZXMkNX7AeWaAUvzsMFZpuF3lfvLC/IqXUgzG
	ioGRtr7b+8ne7zNkLzJX8QXsvT3Skf78BLl6OnK5kDlp0jkgRJ755c09RnFHp94a
	FkJrhxALkLGc2sG6he04uSPC2clSdFvw4qiU5dBWfczITJrlE73kTL4UTPTXaSU8
	uPXYtYu7lys+qZf9uhTvblaIbBNTUhyG60R4jjDQ7aF1CBdjEtkSBgr25ldnCI72
	0C1Jjg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44186ngw32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Jan 2025 00:32:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ee5668e09bso24230714a91.3
        for <ath12k@lists.infradead.org>; Tue, 07 Jan 2025 16:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736296346; x=1736901146;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHZC506u+hUh7w0J0fibA9G0IOLoYOIzEU1XTx2nqU8=;
        b=T8Vn/Rhxv8fHik85KcoU18f0WZPMTVgaaevYzDrhVZjw5m02PQVmKdgD2VxLltv/DA
         8L/Pqrcora+ZNeN3HypXX7jOZw0usxyPZB/bxLkUwiWfi6z+Ti2TNXGDoi4DGn3UF6Ut
         ZIEhsjNjv4FTBnOwt0rwLSLzvr55jIRqZlClqhzEOZ+/MGgCoKsOkfO0HY2b1xRgPuCx
         DAqbRvTFVennAirlYqgA/ccWo2WL3qs5weWm4NwKZlFN4l1jFJeQScLpZhOMvT4BIx9T
         krj50w0cPeRzb96sNLQh4eEj9g1/ky7LBeYJ29aXmOUBsFVloaMzVpa8UByn8IHjp8sA
         Cq3Q==
X-Gm-Message-State: AOJu0YwdY++iIGm9AUmNCVcDxXXXFw4xrjCJk0jR70CdjfzmCJTxWbgg
	OV4kf896F8zXeg/dgKH1/taCbMfXEeJ5Vb7/KvrZ5zvhjvykSjJFEeeoe3bMbS4xKXhx9bZcB1t
	HGhrPiAZTha2pcjrx8lEelre0/edXfLLA4rDji0hmWTWonN2CnlFssiAn2/6D3Z9g7nBb
X-Gm-Gg: ASbGncv8LOcUNPGrHEntRe9OBt5NYB/nop21PopSE59t/zauCun6niZj8nFI6+qbk70
	JecEpU1QNhbnNRx6SbYhtVwJ1A5hvwkBuRpelDaACsphDImhU+Dli/4gSGXYkT7YYC3d6gaoEZN
	miwj/koshup/MJOohdebaw9sy4jbPIjgpJRJHFU10zepAraaIZiH4iILP7s/o0w+jSMvSD3cWxB
	OEg3NmUJPxh5k5m1doDGJAw+b0oh5+fRTb85S94IUc6vACoHLZF8RvVBTEk+E17f1AlSa9zBh/Y
	T6g4WTw/mGlticFB6Q==
X-Received: by 2002:a05:6a21:2d85:b0:1e1:bd5b:b82a with SMTP id adf61e73a8af0-1e88d0ddc13mr1904490637.40.1736296346391;
        Tue, 07 Jan 2025 16:32:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPOTCX/byWQDkHCv+jtV4uadXvSKxjOr4UID52duVqTs8KLnoWGJghI0xdeNRzWDdVMiPDPw==
X-Received: by 2002:a05:6a21:2d85:b0:1e1:bd5b:b82a with SMTP id adf61e73a8af0-1e88d0ddc13mr1904454637.40.1736296345889;
        Tue, 07 Jan 2025 16:32:25 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dba83sm34041162b3a.116.2025.01.07.16.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 16:32:25 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241218040149.4041728-1-quic_rajkbhag@quicinc.com>
References: <20241218040149.4041728-1-quic_rajkbhag@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Include MLO memory in firmware coredump
 collection
Message-Id: <173629634521.3079396.5486696104815389604.b4-ty@oss.qualcomm.com>
Date: Tue, 07 Jan 2025 16:32:25 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: YJOcQg9ApCcsvmUL4wir8TozYLTirKxl
X-Proofpoint-GUID: YJOcQg9ApCcsvmUL4wir8TozYLTirKxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=919 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_163228_910719_ED52CB08 
X-CRM114-Status: UNSURE (   9.47  )
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


On Wed, 18 Dec 2024 09:31:49 +0530, Raj Kumar Bhagat wrote:
> The current firmware coredump collection in ath12k does not include
> the MLO_GLOBAL_MEM_REGION_TYPE memory. This memory region is essential
> for debugging issues related to Multi-Link Operation (MLO).
> 
> Hence, add support to include MLO_GLOBAL_MEM_REGION_TYPE memory in
> firmware coredump collection.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Include MLO memory in firmware coredump collection
      commit: 9035756c18852cf39eeb11b625db094a2c9a4bb9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



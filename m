Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B20AC7115A
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 23:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZ4FdOFIakuXxnQEVyx+5eGfp3wSKPDG7zSbpNvGx/I=; b=BaJnEGqZQ1OQgGnDgoq8oOpKgu
	alLz5xNr3mx49+Io3hbTUbCHOgZdbqGgpbQPMSfIXiNOS0/xdw0CzaScSS2Z1PkSLtzAtQs1nojPa
	XVRg+qizEClupwmbaMNYAsdu5GD/SG5GzmKPPaBeAoj4LVd1HbyS8aoPoYBUweS/wGXE8fbGMzgvs
	K/zDcqPtNS4gwvNDQUqzb7q2nXXN3AaWziC4a8d6yF8PWaHPSYOAQArEeCZZgjt+UJJWrl/d80k3n
	mwqwfnLZbzuXwXRmplMjisFN/wjl5O2jxjhYTdYtX5U0ZDpSEC9L7FoZtEXkBqc7tPtRQ+2fu10oP
	Ufl0M+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfnH-00000008cl5-3O4E;
	Tue, 17 Jun 2025 23:32:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfmw-00000008ciC-30tJ
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 23:32:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HE3tlg021241
	for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 23:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZ4FdOFIakuXxnQEVyx+5eGfp3wSKPDG7zSbpNvGx/I=; b=fXKJO8FIMXuwCIeN
	tNZrRe9xhGdVsR/sfZ18+TjQqohSqS6pa3Vz58GcB7GC+FX4mZP9JLiNWgHwOKyv
	A2GbslE0RxhymP4UTNIelUUBXPfFLNxREU6nwks2+QkB9l/5hqfG1IfUC/nSaeEG
	KNu/ef+We3WJLKGu+pUEm5xLzRZ3ZidQ6AlL9pxUcyYbcHgCcpG02VE0k7Spk3n9
	HZPbJ7X+ZJahCZ5TUTmBl+ThBHWZ53rxvMMOp2kdD4yvFKxbzYW5NULSC/v3GkQG
	tjGRq94qdOA2VFhqcFB2l+NYTbak7pnAQUukyY5KSZpPHBInvvvMnT476fBYAwep
	Iet/Yw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5rq9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 23:32:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234f1acc707so40931975ad.3
        for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 16:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750203141; x=1750807941;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZ4FdOFIakuXxnQEVyx+5eGfp3wSKPDG7zSbpNvGx/I=;
        b=ox/FxINLOBot4O2pGFXtD0YSYgxXU4zDpc5uFLRJa+C6vp4xt8h7GWp1HosC+sg2h/
         Gl9KqNcXR52nLZqux+yZ6AZtnwxw6was5GZsOI6NN5cdemovnXVtAelKvptDr/vaonvD
         vqqw1ZzJz3btzIWWdqBIs4IQN8T5bc5+QgPvH8mcMumM1BTjB8rYTvCHj06ZqQYzxCus
         C7Afpc3UHlMy0ehm/vdkApSVMeVs1fDQ7sN7bi7QQt4NeEJfbBwMAj7X10ffjSORmlJb
         WZAPZyNVoojpfNvLV1jKyilM2DsVF55eQwSGnKNtijZ5Ed9n9eNDELpR38nBDi0ixT/+
         myxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWVGPFOsvaiOKgkcCvHTFWPP/E5AH7VI3Vy1WxX2Ooj98ySb7jq6X8UilyCh4oapfxEJLqkSg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNTd8+dEnDvuMFyrAPq8J6ekM69GdNilgyeCS0ffIqFpxeaYuv
	TaQUZ6wkW5qPDLSy+DkVSEggNqxI3T99zQooTXqCkMK2W/7iMIEVDRQAy20i5Y3kSRe9BXoDEvD
	AEBqJa5zyxrC6lLBwS+GOdo74PIti3POBisP2l54w0b8jesb3+ovUUdN83+DORFIW
X-Gm-Gg: ASbGncstfRMD2C/nlUgYBEhzoGIV15L98AMDcIyoj4Y82j/UBJtOzLdPDK2mMjYh5pF
	Yzis6tZsO3KlabpdwNkCbP0FSAzOmlO18aaNFBv40+N6q6lcvH3f50ZwJd3sEFKfJcRu+G574Kx
	+jqD5xIsKdLGiLaPBRStAay1XqVx7NGakXhrQtRam4scZQv1R+pAA/GJk7rb4rx2YJ4YigWbHlY
	jumM1c6C1HTJbql+cJfqSpgqG7/fBfZC8R6LIEKUODDVP5UGehm8qzUZMQHXx+0bubECj9EgNS1
	mz9GDKTlyodq07E1Ho/FbAXt3EIG0LDaZK9jsSrZL3iVZJZJTDdyBEMA2nY=
X-Received: by 2002:a17:902:e80c:b0:234:f182:a735 with SMTP id d9443c01a7336-2366b3acd9cmr218530985ad.34.1750203141253;
        Tue, 17 Jun 2025 16:32:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHRvrUYB8tbc6pP2l3PnvgjQCwiR+ff4pjdfIGh3YBUmg+FQydrVipUHwAYmdF7GwwSPh6Rw==
X-Received: by 2002:a17:902:e80c:b0:234:f182:a735 with SMTP id d9443c01a7336-2366b3acd9cmr218530655ad.34.1750203140862;
        Tue, 17 Jun 2025 16:32:20 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b84e5sm12731527a91.2.2025.06.17.16.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:32:20 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, g <gregoire.s93@live.fr>
In-Reply-To: <20250612-ath12k-fw-fixes-v1-0-12f594f3b857@quicinc.com>
References: <20250612-ath12k-fw-fixes-v1-0-12f594f3b857@quicinc.com>
Subject: Re: [PATCH ath-current 0/4] wifi: ath12k: fixes to firmware stats
Message-Id: <175020313996.3793705.1525991907377461235.b4-ty@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 16:32:19 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: rprMMuxmAWQVStfT1_KiYTHEBc4euvWP
X-Proofpoint-ORIG-GUID: rprMMuxmAWQVStfT1_KiYTHEBc4euvWP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE5MiBTYWx0ZWRfX0APil6yjyToq
 9ngMQWXc6L+YqkrsIXIZGQIApB6XlRAOPHC45pYM10m2/K2b3aFLBl0kA8H6gNqN1rBXPtlUoSj
 XxEmPRXY0IxOUghqNMPfWYZC9IfaeKFqgwH8EnCy9VitIbOm+iW4l+g2wdMhuuE3fBkYVeeHXLr
 pghz/AXAJcWvmzXXDflTO77nOAVHKG8mh4c6Bk417i8yrLOA6AqKJrPCqfr8E32aNAXupRHLIQU
 pyR5pKvJni7GQJuKlnURmE2Q++zZs37fG77r8un05grbWjgBz4TW7Id2FY0S7oLq71NQ+Dyzs3a
 SwKeJU64R/Qng5Rbz7Ls4j+Ww5il+9ggvM9Lii/pimrOcBEOx3zwpxenjEK6KMq2BMa4pGknclC
 fyaRPNOoOpCCSaauUCjosBsFP3aKWo9blLLfePETKYVWzGd6q5uX5FPWxv2tp67POBO9ZxY9
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=6851fb06 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=ImaOgrEwS3qXJJwQdZcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_163222_768383_76C33A52 
X-CRM114-Status: GOOD (  11.63  )
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


On Thu, 12 Jun 2025 09:31:48 +0800, Baochen Qiang wrote:
> We get report [1] that CPU is running in hot loop while requesting
> firmware stats, fix it in patch [2/4]. While at it, fix documentation
> on back-to-back firmware stats events in patch [1/4], and fix potential
> failures due to static variables in patch [3/4]. patch [4/4] fix the
> failure when there is no vdev started.
> 
> [1] https://lore.kernel.org/ath12k/AS8P190MB120575BBB25FCE697CD7D4988763A@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM/
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: fix documentation on firmware stats
      commit: a48a931a32f88157db2baa31c10738a7fe660e93
[2/4] wifi: ath12k: avoid burning CPU while waiting for firmware stats
      commit: 9a353a4a11a475578be3c02dd17e70afe3a4a7f6
[3/4] wifi: ath12k: don't use static variables in ath12k_wmi_fw_stats_process()
      commit: ac7b8ff7839ded757806317ab8979be844766770
[4/4] wifi: ath12k: don't wait when there is no vdev started
      commit: ad5e9178cec589bf3af589dc43e638e5a5bf56fa

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



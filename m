Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F58D2F339
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 15:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVWFI4N4Hrfdkqnsqe45+OS049az27v3jGHn+1hL+ko=; b=V92rNrCmo1c1EGI8cIMWB7Cj32
	adokO1chkWeTbz9y/LJSZL8OCvtwGOXWV4YkbwXcnbvNSnZkdV0qkfigYCt97kPrftSv0SaROyt3P
	I+7zs2BoJFxrrcc4UO69HJc0DuI+2QwAA7ORyqhcTpROearInvThlCnl0qOhL11U+RM66qAd2B/9j
	gWo3Bdn1c5BB8nZxOoK8kgUudGrnsFIajVM2h8X1RitWFK/6p0wVt98plBalB3CziTwGAbQQixh3h
	UI4PSv5CqOLh0+NaGpInjlKOAZOmYJHmqAOwz63PGE8fBIoXpB633JYi7glkkHzELRqjdu3iMIpr5
	WOZhQAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgKq-00000007NL5-40eV;
	Tue, 13 Jan 2026 15:29:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgKo-00000007NJf-19YD
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 15:29:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DEpuBg3301643
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 15:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RVWFI4N4Hrfdkqnsqe45+OS049az27v3jGHn+1hL+ko=; b=Ue4R45njqdiFzoR7
	sL7dszXBNCH3KkhHyVcLfIPSFd+B1LRB+ERHx25GU5z6ic+DhsI6ls5d12UzuExU
	rXKHeOvQvtrw4pfvWpOinTO/1KpluRj3ade0ISdeiPdW5Js9eNMO2wd70g8WxlMg
	THDmusZKI5PMD9FsO64SpMRb9asyc6zhpV9a73AffziDiLFo3QnLd3dzsJFx3QEw
	2m8cc5teBs2LNvPxitedImokiK1xf0HSI8u0mD9PJ3rnaGW+oXXQCwOnNekXyAJN
	9GURivqXhOf64a9URx7CsDjlTQ82Q7tFleG8oLB0Zvr5hXT5bkrv3cdPdX636OjA
	bW6Irw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jmba6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 15:29:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b0530846d3so6890521eec.0
        for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 07:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768318168; x=1768922968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVWFI4N4Hrfdkqnsqe45+OS049az27v3jGHn+1hL+ko=;
        b=HIQ3DpKx5QyolTY4ifbJw5Ll95IfRQ+dVA3+NlMRDV+Rs2+Z+3RcxStMPAqXYdMVWt
         zitgon0047OEH4RHnmKE6iuumE9EoSNyvs88SYUZfEHuhxIKFsDKSUXDuuTez2ykvhDd
         UsC3TY3w35zEZRdEnfMtAGqjDwWQClRZC31NR+RoZ7QeGhXlzQIFDCUnp9GKZBdWiYjs
         3yiqWHk9XFpwo4uXjms0fboXFeoa3AJh6mVvVUf17r0ckyIS3gZr0sLyb4yfhrUWgBwB
         fQ/WiB/7is+HZaqbIjDLvBO3aEsG13xhzwwXQKsiBIX0JbxjkIRZBT4EaIEdYObqmMci
         rmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318168; x=1768922968;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RVWFI4N4Hrfdkqnsqe45+OS049az27v3jGHn+1hL+ko=;
        b=IqqNp0ZyhUBW20lex1qwBJByX5AIqWHwsvnYELgGWx3hBQ7BBVEk8oCn+TDd44/0Gw
         0xrWh5fDi3jYVnM6bQHFBsB0iZi1t0DmN143Zz6lVBsC42WvSdKcE4a8O1MjgY3Thu/p
         +Vb9oU6it+Uxtvex1ikOEiFlhOgco68UEJ+aptjuFgyPGuuYKgMwYL1ZngQ1zUnuCFO0
         hzaTJZ32P0iAd79cPwhWPaozPDDEWrBC+rYSu35VY3usmX/Ff1wtNG4M5F4acc/OW0G7
         LjGqZq/d8J8HQJjuNTDdKoUo/uTmPAvFE6JD54EoduxYA72VlR6InS8Y+xNEgqasCQ1m
         cFUg==
X-Forwarded-Encrypted: i=1; AJvYcCXSti2IfN+soeL2dnHydb2+PlFoQMsTMhvb/vmI/qyLW95VtL4eKhhhfLnPRVTEx3BbSFYEh2o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPahiDqBK5H1qenfuVHNX0oE5spq5PgpmOytW8DSzg6gf5O3t1
	Pr++UgOuPYYSlibBe9yo4/vEH9Te0aiHxx9YGhgxf7h6afKa3ZKF8XrfT0cTojfpOUukOXua+hx
	qgJR9s7iRQHFFforuQjNtREhEcgiXwjA4qPrZCOTaI4sVo5W6FxVdm2+I2afpCa1RRXleA5ts
X-Gm-Gg: AY/fxX4hWjOZUnFhXrqXy1bkvBP/vnkU/5SQaLHbRr+CsL0phD2I5cwMl0rkGqHOCGq
	OtktoNDd2MXjfXpOmFJTzord03hBUXpXTJdF0E8iE5YrC134nC4xfzFh827nFYx2BjFNDPUVCu4
	eXtfNAhZpmEQsPpHpSrUIbWW/uLdozijYPkKnPpeRDDoq1Gf4QiDJBBcHmjvNUv7Qnw1CG1kb2U
	McjrMM37zoh2vES5neWe+3UlMPGXke9QguUdld/lhUx9/vS3tl8UTmSnbhaXYEe4LL6BnkoTu8V
	zX99KdrfwMd/bn7B91YpRMwtCT1UsZq0ZVKkbRKRWoyUoyXCy0evMOc+XIavP2bqVSAa5Dh+pnL
	8gmaTVYiFIq42SMkzNCrnIG2xCSoIOX2YbE7JN2hgEn6+hLiHDrG3tZ48gc5gOB9A
X-Received: by 2002:a05:7300:d15:b0:2b4:6e2d:96d1 with SMTP id 5a478bee46e88-2b46e2d9c9emr1974822eec.25.1768318168166;
        Tue, 13 Jan 2026 07:29:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0l+KvTel1JR161uOtDNalT5bd3+WxXcmCVbfQ0boWnz4a5//h0pclME4j4r2qGnRTnOh/jg==
X-Received: by 2002:a05:7300:d15:b0:2b4:6e2d:96d1 with SMTP id 5a478bee46e88-2b46e2d9c9emr1974772eec.25.1768318167621;
        Tue, 13 Jan 2026 07:29:27 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm16858049eec.33.2026.01.13.07.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:29:27 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
In-Reply-To: <20260113-ath12k-fix-dead-lock-while-flushing-v1-1-9713621f3a0f@oss.qualcomm.com>
References: <20260113-ath12k-fix-dead-lock-while-flushing-v1-1-9713621f3a0f@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: fix dead lock while flushing
 management frames
Message-Id: <176831816701.3453943.10000086069261177867.b4-ty@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 07:29:27 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Cy5sJh101NoO9I3ZLklNmuhNwxIuEuVB
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=696664d9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bB3gi7QyEn5T5f7HmwwA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Cy5sJh101NoO9I3ZLklNmuhNwxIuEuVB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfX6I+criUxqDL+
 JSDvzDAkDXwo9HKgcKvx0zdO0eBnyKL/m+W74PUskSEgOGAfvvNs4tMfW7N7Whk8/Y0xNA7rchT
 VktqaRgceKvMd8alo9RNCQHX5y5J/yVkzkfdeH5hdxhAw67+yYDK85nyf4TYxNfk9YwZJLfaxjb
 mfHpDY1Oq1sJe5GhuB3bFY+NnbkBmjxDCyuYauIpgmZUvhZReWTVGu4hMxUJVz6M1lIl1P8W8uB
 tHBayLnxDZmiMdPEZMd+QwjDGJgDVSc1IsB/hV1EtEjWg49QMMSu0ebFFeOVXtaNato7/M9JTli
 MRsvfCh2FiPID8lIOBYS49i4QceT38K+jrU8v86tzn7sKDyezX3CVGwc/uoMqpDnjTulsBOuYwg
 +bHmdZ1HUqsNIkso6zmCdzFno/aLAQNRqyTpRyDiogjly7pSQ+7sRX7gu3HhulSR+jOv9+wBdUs
 nAq/xbZ3AutxQnPqzOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_072930_437768_FA4ADB3B 
X-CRM114-Status: UNSURE (   9.52  )
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


On Tue, 13 Jan 2026 09:48:11 +0800, Baochen Qiang wrote:
> Commit [1] converted the management transmission work item into a
> wiphy work. Since a wiphy work can only run under wiphy lock
> protection, a race condition happens in below scenario:
> 
> 1. a management frame is queued for transmission.
> 2. ath12k_mac_op_flush() gets called to flush pending frames associated
>    with the hardware (i.e, vif being NULL). Then in ath12k_mac_flush()
>    the process waits for the transmission done.
> 3. Since wiphy lock has been taken by the flush process, the transmission
>    work item has no chance to run, hence the dead lock.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix dead lock while flushing management frames
      commit: f88e9fc30a261d63946ddc6cc6a33405e6aa27c3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



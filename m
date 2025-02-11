Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E694C0219B
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 17:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIbwzt88IOlIM7ovEob9ysi+vR63JxcMQw0JjrVkxNc=; b=eidOiSNx8B7gocFGf0Y+cBTPjM
	gevCIoXcZsibYCZkp0SfP1iazaAz3PZUrRh2x9UiyvoyMpy3HXXQA2RuhEvKnP8m5biMfNEm23Y2s
	7zmlFyLFeHM/de5OdoA40l7tOshJ1fV4cS7erZ0ogt6YKMGWTrdtfD6XMHnXikA7ILsaVQ4bKfQRh
	mSF3GHHAvf0D6j+Cm80YYGYlpF/JYL0U6+I7UT/UFvoRJPysY2PtRqEnnUBVJqoIdd928t4pyr4XK
	BUhRUfu+KVtcAqnn1HuYx6McXy3FlfCSAcMTWzzf7Ja/BjliCEJuusykWBAt59k2ICtxtP9bqDCOl
	OnXvm39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHv-00000004iq9-0SLw
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 17:43:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHN-00000004iD4-0KCy
	for ath12k@bombadil.infradead.org;
	Tue, 11 Feb 2025 17:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vIbwzt88IOlIM7ovEob9ysi+vR63JxcMQw0JjrVkxNc=; b=NHMqklx9HfIw/mDImZpIPp3EBg
	eD4g6FXYgV6QNCxo+GuhPIffdPNAMiFS/2fikstIwcLHLDzM2jWpZ8OExzN6z6uNYZnfU00cdK9iY
	IXU4mGHOQPHaepKfcQLIVDxDGkU9Ulyh7xICR+lFpXaE/QF7Tx07veDbOYb9hIANu2Yan6HN1isSd
	SFTcC3FtlCwARscpFB/I6STVS+xp8Gl0EIdEyDHVip2jIR5j8jBgYgc+Ylw5v8c57LncBSxvB/FVZ
	dpSMwHZD7c85u+KQsfu3rOrmgfmOVwgJK5nLi09LVBBmKeV8kHpqcDE7u/eEWXoDVeyRhWfVW6mnz
	0+0XcFBg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHJ-00000000efS-26nl
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 17:42:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BCRSfr030318
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 17:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vIbwzt88IOlIM7ovEob9ysi+vR63JxcMQw0JjrVkxNc=; b=duOG5LTccppb7HwB
	Ndls1LQwjK1r1KEE9yMJLSYc43cwbqyTIN2GLsUNsH81lsz3BVfAVeocVduZnKKQ
	VUUZYaDEjr/lXH8yqR4Qwqtap5y0yu9+V+FH76UlJNQ6BlRrr4374/slEoAmtHQz
	qlcZ1rcaKgNrlOsZ8/7tm19ujlefIps4nlegbJwnFeoX94ScqpRByokg4hBA5Xfn
	wCe/1Us1tH1X9Q6RMWfxLMjsmC2nazcJsx9FsAb8uDEJloLYaZDg38nLpwfXKjat
	jTVlzuUGQTAemNNyo1zR6P3+xd5qxs9sonBisLUxl7tfPTcrBg73zg50bBONJMkl
	92OTPg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9j8w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 17:42:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f46b7851fcso17500858a91.1
        for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 09:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295749; x=1739900549;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIbwzt88IOlIM7ovEob9ysi+vR63JxcMQw0JjrVkxNc=;
        b=BDaMIdjI5DPyE0yu2EuWlUt9E1a/7fDLEF+t/NboIj/rjrUkzCNfiktKl5cgd1PkjE
         6d6JyOTGnKf8gHn9WRxwb454OerfQIn657nvTpNIe0/qYMbwHNtzknsnBdPZah5jHhaV
         yHLxEEbbSt+axt8J69wC7uTNNGe8iudr1O7lLKa2FGxFg+wYVWWwvPav/0PXdYp/Ys+w
         w9Cb9Pbvyrg52orxXGtkeAmhpY16Z4ljTgJ75AFINxQFW0RiBJL99Cyy+S/jCJ8s2Ex5
         tAO28itzXBqjtm3heXljooz6gKqwiuA6ktxYsNAjofHYZm7NZE9DCjCUo9VKnY2LzpkV
         xTJw==
X-Forwarded-Encrypted: i=1; AJvYcCX6tdUENA+6nRGf4kq3Jg+IgrZHc75QuVwgbJwEgwFqZyNUZqQBdzN9rrCP4no9JNQLKesKjSc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn9dRm6u9IPWxIFI23Qo+ZA2F9XvQ2/alThDIsDgn8bnv5peHE
	hwLeBOf16rQ6kkD7QGg7ZzPITkC5DKoOvRh2NqR6H6ZzjLsJGmgTfpLI04toRmPUyXRUpGBH+qA
	d520RjTqAaALkrmpjO/X147XeuOkFeK2xPaMW8eXgr0s9oL/nWIlLwhrk8NCj
X-Gm-Gg: ASbGncv4tsF2f1NrgdFyiwAwi69FJA5QCocPtG2ArehHWX1k0WZhBnGzOiZ6fe4ndeU
	Gy8lf1kBhoSP360DzlPTSrGKteEog79hvmHEY2QtRlvdLgenwPU1mU13d38eZGkyqT0y8IBXG07
	tIooWe64YUB8RFq/ZwQgaOSxvrfYonqlWX5IWYSqc2VdKBxn4FnDlvkM+wY6UQ9n0zvlXqRB8i0
	D32m2HiM4zAsXa+OAs/3Jwutz20CopFtIGl95yRDHzY7BWxSvnSEMMm7rttpbV/k7RQc/T9iTJ5
	GyUMX9/+NrkMraH4le/9CekKesDKw2h8EjQ5FAzRJczRQ8fioX50m2z4bwI3
X-Received: by 2002:a05:6a00:2e9b:b0:730:888a:251d with SMTP id d2e1a72fcca58-7322a70a1a1mr995113b3a.20.1739295748676;
        Tue, 11 Feb 2025 09:42:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFe0Uq/rWJQikGAk1hh1Z55Tn1Qz/ssH5a7k8aQ/7KisDVypi6ZarIlRlks1fwopusQNqa5RQ==
X-Received: by 2002:a05:6a00:2e9b:b0:730:888a:251d with SMTP id d2e1a72fcca58-7322a70a1a1mr995073b3a.20.1739295748234;
        Tue, 11 Feb 2025 09:42:28 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730918f6f04sm3763928b3a.24.2025.02.11.09.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:42:27 -0800 (PST)
Message-ID: <927acc4f-c227-4146-8897-96477bf96ae2@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 09:42:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] wifi: ath12k: add 11d scan offload support and
 handle country code for WCN7850
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250121104543.2053-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250121104543.2053-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GYlNXMm9QMexj1wg30bJ5whKmEZmYDaY
X-Proofpoint-GUID: GYlNXMm9QMexj1wg30bJ5whKmEZmYDaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_174233_893403_367EB07F 
X-CRM114-Status: GOOD (  15.79  )
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

On 1/21/2025 2:45 AM, Kang Yang wrote:
> This patch-set mainly does four things:
> 1. Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID to firmware.
> 2. Implement 11d scan offload, and report country code to firmware by
> WMI command WMI_SET_CURRENT_COUNTRY_CMDID.
> 3. Use WMI_SET_CURRENT_COUNTRY_CMDID to set country code for WCN7850.
> 4. Store country code, and update it to firmware after device recovery.
> 
> With this patch-set, WCN7850 can do 11d offload scan and update country
> code to firmware successfully.
> 
> Note: This patch-set is an old patch-set in public review written by
> Wen Gong. Just resend it for him.
> Link: https://patchwork.kernel.org/project/linux-wireless/cover/20230914090746.23560-1-quic_wgong@quicinc.com/
> 
> v9: update copy right in patch #1, #2, #3.
> v8: rebase on tag: ath/main(ath-202501172342).
> v7:
>     1. rebase on tag: ath/main(ath-202412191756).
>     2. rewrite commit message for patch#2.
> v6: rebase on tag: ath/main(ath-202410161539).
> v5: rebase on tag: ath/main(ath-202410111606).
> v4: rebase on tag: ath-202410072115.
> v3:
>     1. use wiphy::mtx lock instead of adding a new lock(patch#2).
>     2. rename struct according to wmi naming convention(patch#1, #2).
>     3. update copyright in reg.h
>     4. modifiy patch#3, #4 due to struct name change.
> v2: change per Jeff.
>     1. change alpha2 length from 3 to 2.
>     2. change wmi_11d_new_cc_ev to wmi_11d_new_cc_event.
> 
> Wen Gong (4):
>   wifi: ath12k: add configure country code for WCN7850
>   wifi: ath12k: add 11d scan offload support
>   wifi: ath12k: use correct WMI command to set country code for WCN7850
>   wifi: ath12k: store and send country code to firmware after recovery
> 
>  drivers/net/wireless/ath/ath12k/core.c |  34 ++++-
>  drivers/net/wireless/ath/ath12k/core.h |  17 +++
>  drivers/net/wireless/ath/ath12k/hw.c   |   8 +-
>  drivers/net/wireless/ath/ath12k/hw.h   |   3 +-
>  drivers/net/wireless/ath/ath12k/mac.c  | 167 ++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/mac.h  |   9 +-
>  drivers/net/wireless/ath/ath12k/reg.c  |  72 ++++++++---
>  drivers/net/wireless/ath/ath12k/reg.h  |   4 +-
>  drivers/net/wireless/ath/ath12k/wmi.c  | 160 ++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/wmi.h  |  40 +++++-
>  10 files changed, 486 insertions(+), 28 deletions(-)
> 
> 
> base-commit: e7ef944b3e2c31b608800925e784f67596375770

Can you please rebase again?

CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/wmi.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/core.h



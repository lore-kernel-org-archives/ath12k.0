Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53213606A31B
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 01:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S3vA8VF3;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5D/lv1L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G54qloTv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0+9YNlYKXmRrXqEDmXvMuWsb0exY+irNt51zBtdlK7Y=; b=S3vA8VF33io8CT
	pcFqZwEgE2Iu1l1sqBtYlNlQK0vCRmgDaduVX2vx7LN4X12FiAOMeqAMjVpdGkM6CYK3cBZ1ZODuL
	92BDGqFUVaqpsfKGIxq2fYcsnxglUoXUsAUyLDJ+Kr0g9yCaJOioqfiwOANEiiAhbXFU9GbWWdS6Y
	37iUOBoDVYY58b0HqoDBP9Zv3BzgDxUU1VfhwkABCzJpXzE0m/JDfRcIfqwNO+m2H2Aib/UCQlWiP
	jIDyj5k/xmqNt5QxRHnLWM4s8eScOo+uISKBxvj8UblbPn1ICjkxV4Rt6YdoHGWC9w2UZZzeqn7jx
	Hl8xh2/KtpCaMxIs1QmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm0X-00000007R21-1liY;
	Thu, 05 Nov 2026 01:11:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm0R-00000007R0a-3jGn
	for ath12k@lists.infradead.org;
	Thu, 05 Nov 2026 01:11:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50olIQ4021456
	for <ath12k@lists.infradead.org>; Thu, 5 Nov 2026 01:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+9YNlYKXmRrXqEDmXvMuWsb0exY+irNt51zBtdlK7Y=; b=W5D/lv1LWTCDzOWh
	0L/f29deMLoESFQnp2yCn5ZVcV0MlX/MEg+e52Nrz4slWpWiGd0Ux7/i3TYnNoZY
	0nJf3OXTs26avJe/rLFJPzvKK1Tqanyo9J/zwafZm3lbJ6M49KgkZgw4VmPqkzgT
	roO9cLBawiAvG9i59upiEQlPCoNKeXo9oRbCopMar2QW5DS3DwK4UFKuTqI+7he5
	k46SMFt3G9EMwsy+WJn+jcSzzI7k9uhmirobk7w/4b+3orKqo/VH1mY7vWYcAJLj
	LSeTdnI3hF12qQ9iScJTuddhc3RbTsOY8tyncbRm6DeAZUZLVYskS4YNyrCYecql
	iUqvAA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284ukau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 01:11:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so1794964eec.1
        for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 17:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793841066; x=1794445866; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+9YNlYKXmRrXqEDmXvMuWsb0exY+irNt51zBtdlK7Y=;
        b=G54qloTv5wmVBBqoxzHtdFa0kCXt8osdevIT6yKHSyGziIUEVl/5SYA10t9RJylKSR
         FswapodTO475TRoFfwqAHrVKjnnxdY2kcDlX65MQhBZKNj6xLGVnQnA1c4QnvXilvQOK
         Za8mKluUry5gi1NUYwZaosAPYGRLl1oWNPxRoG26dMlisneXCdUCmyJV981MiXT22/sa
         Fp2BsKNFUA/UJR7ur/aMBCLXJymrJDgNFvIHmewq2e8VnO5tK8E8xEy6+YkKMRhOSCAK
         bN5YOu7ezDDS7JuVDxNfDgpOSHxPXZQqHzEig1QLa+Sr41teL63RMQPF+P2UV1cWRsQ8
         /CXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841066; x=1794445866;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+9YNlYKXmRrXqEDmXvMuWsb0exY+irNt51zBtdlK7Y=;
        b=CGPrAAwsAcmwT9s7PYxNehtRPnoOQqpCpFGP6VypXp2TP5pnsmRJgcJg4ns6fxxBcu
         IBYUg6JA+GG3WynlSY5nWUi6lTgXaOM4vgnHTBDs9mNJWicybhK/q+i+X76X94pwPtHF
         srbE8IzxKh8ozlQQlupGXqVlHsndJ4Dz7cGW/LS8RHtTqwMMXN1D+9Tf3RGOFIUkYAxz
         1UZJDU1A7EpxqNkRFuzDIc4XiHCJ8lAjzQOO3Z8JTit/Nb22kCTIDNcSWILY+laX2YXS
         97NEniGtGgq0qcCm3o+RxRBt1uqmd4vjaGvbKnTJ1oRvxoCqr8QXiRjCJ5uMg+m1YmG6
         HexQ==
X-Forwarded-Encrypted: i=1; AKwUvBxI4UK3G2GcwjaTF+CV52mnd46FrSlFUK7iVqrV4iJketB+b1WbbFqse6iOgENbqpEJyvkMpWA=@lists.infradead.org
X-Gm-Message-State: APuU4Z9Iwd3p7zze9d9PjOShXAWwRITN+UQn5zjAgzK/8tMPZ0IOFXQZ
	4T6w0U2Z9QMtJFyfDKlbqTtitciTy+De9V9cbwGfutOLgsDev0qqHn4eqfbU3FvydraPPpad1Pm
	JwKQFnKYRqkEXx6bCvPaQTYdK/sQRUeMh3fqirrc7a624QC2r5hEw4dDoyeNs5XUD
X-Gm-Gg: AYBFou2FW8oyb2lgla/No06o8Myhela0HGFVZJ8xUYWH42luVjsWEBwngz+3ER4nm0B
	sZFqxg0Q1UhER56A1cjocszNeowdDbuPEsT58t7XvIoaHjN34FnUjEJryg5rdW6WQde80v6G25z
	fH0Rj8FAz7npIAoQuPeB93zlprpx9d9hZIkEknzkrkSY2ZiKd5h78kSJpvoiXj6T1foRMRjl5Kt
	84tzxcWPYaWpbBw7UPSSOZFB56/DDm8hOadrKer+ygbbhNzjtqyeMkIeUtChEihme6gV7Fj7+Yi
	6Z9T0Xgc0j8l7HGPaHTWQ0CbGO84x6FYkHiRM3kQjfHiXFI93J6RDitx0PJQTu6zc81+dofcNiV
	Id8rOPdPk1aNyybGnzPa3HRjwmMC5pzw84X94um2eHX0ISlQplKOU6HU85UUBU1ZZ9RXIuEh/VN
	/AUiFvJoaOUH0jCvADsaucw5Yu5P0cbg==
X-Received: by 2002:a05:693c:895c:20b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36a4236a466mr25817736eec.11.1793841065635;
        Wed, 04 Nov 2026 17:11:05 -0800 (PST)
X-Received: by 2002:a05:693c:895c:20b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36a4236a466mr25817701eec.11.1793841064981;
        Wed, 04 Nov 2026 17:11:04 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36db94376b1sm4190698eec.10.2026.11.04.17.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 17:11:04 -0800 (PST)
Message-ID: <61e49149-5096-4440-b261-ffe2d250f6f4@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:11:02 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20261102
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <8e38f8dc-88f9-4974-8f98-687795fb360a@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8e38f8dc-88f9-4974-8f98-687795fb360a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aebd7aa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=uPsaRaffaKHOGCdRA0sA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: QiLlg1Qm9tAbnYAhk0oLc-uil374CVOS
X-Proofpoint-GUID: QiLlg1Qm9tAbnYAhk0oLc-uil374CVOS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNCBTYWx0ZWRfX7LLLhcX4/xw8
 M25b0gv2ayyERfGqR+ZGan5pNhNgU6ctPf9yBWTVx8ooB04C3zriDViAVLYgazX0XM4CZb/mgGG
 kUXd3Vrn6pCMrTp12G7ejcOwvmf2DuZ0Xhi4EL+ooZliSfXMUzIM/RkurOUZ6csLNJleJgyRWFf
 dffI1cuQyvSWRG9XknH0FnzFsjbyzxNiFpbi7zpsZn0KsaMeM6KftV5pfjqDU7KIAI1vpYRIcT9
 ChghrNyUiPmCZTPwYR1EEDjHWdADSIfQtnKiCj+PJx6o0t3a6KWF3K/4+zQV4BpbYQZWLDj2mpM
 tgmBhrhsgvVsu3azAP1/jsUNYmEFblY3yLchxJMVFv90NfDDjq8bEyPMfRCLLy4VwlmhQQyUGEN
 4P36lmcOuLWtZ7Ipl31t6U7BJQwb5iKAmtd8iS5rct0VAnZuJN31PiAYoTDS3yuyIlCYp/BjET7
 xpsRG94N71nfJWeJHeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNCBTYWx0ZWRfXyUu11JDYDM/C
 UepB9+ACV7RUARszK5Rmy1Y/zB9nFIywHSBtuH5h6ZrBc3VEhWW+ZN4NZMIOmVzpJPCmP+L6NQs
 qziN+MQDfyWxpz4sDpAohqsFg7jF4IU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_171108_816391_CDC00F91 
X-CRM114-Status: GOOD (  11.40  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/2026 7:37 AM, Jeff Johnson wrote:
> The following changes since commit 25e73f1d6868c759c8eb56cad4e411692c5341b4:
> 
>   wifi: mac80211: reinstate IEEE80211_TX_CTL_AMPDU flag in ieee80211_tx_prep_agg() (2026-10-26 12:20:45 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20261102
> 
> for you to fetch changes up to 83d689bbe8f90ce39961bcc3a64f2ca2ec184019:
> 
>   wifi: ath12k: don't advertise EHT-MCS15 to firmware unless we support it (2026-11-02 07:16:28 -0800)
> 
> ----------------------------------------------------------------
> ath.git update for v7.4-rc2
> 
> Fix a few user-visible issues in ath9k, ath10k, and ath12k.

Johannes,
I missed the window for your wireless-2026-11-02 release. Since you have now
fast-forwarded I hope you can pick this up so that I can also fast-forward. I
have a series that depends upon a revert that went straight into Linus' tree.

/jeff



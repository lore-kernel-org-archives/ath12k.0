Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D575CC43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 14:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5Lwhy4eroz9T1Ks9h0aC6xjEPwY9tHUk8isUGec8O0=; b=gWdCpoeUum+s/7Dape2VYCu3rT
	qz4R4WLxlktOsAoCqzOLP0I5tKqJ9EE+Gp8VhzR3wkTVWPsicfMtivhpgdlfOpiVBLblPSLC6u7sf
	VzoR80SYb2/fw2OVzuBWWsuo99CjktNSDL5UEeSwFaG4V8pK5uTCLr/xfopzTbzutYWbBQLnHQyLH
	tU8Kcuz9k4TXw8ftctPZsmU554kUHMKOhAGDPYjF6ghqWDk0sUbm6PYYZ6+QOrCUPYl3qfxTDZbLA
	iLLVuEqnmPjq8s5jCPjviJQSFX+G4BQY2lkdciQBCmjIJUXPMSUvW7SyeKWtujZ0Qs0n46++avZ4Q
	zQdDyF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZso-0000000HJSC-2LEJ;
	Tue, 30 Jun 2026 14:56:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZsl-0000000HJRe-3nbN
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 14:56:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDs0Q2200467
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5Lwhy4eroz9T1Ks9h0aC6xjEPwY9tHUk8isUGec8O0=; b=Wr0/59mFc9OTU80n
	nXLT2cQCdAV9GJ3cu5zPIhSXd/2XztxVhHbqZHpt6P7nZbkiKKRZUYJtsSVrc6zE
	HPTE8IuqMEFXeGRWJtGrdXNKcOLL3JEFdBG0mLvCq1hRiAwX6dKZFdUiXL4z6ytq
	unzRk7zoN4F7o4GtOdybXzQqT5dtXQjajm2j/CGsk3P6ABiCIeIdj4ha8eF0GNh3
	scrDIbjuMmuHCtbcvuotSMhcX+ps9q7zs9rJVaZEOEMGeETpmfsUh8XHDzkgtKjl
	9E3p65bBCLcYhLtNL0UqSPOhsuxnNgmPRXTKZ+IzT80psyxTVYDSgpmEO0i+C1jL
	mUm/lQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc085wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:56:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13b0686d13eso6256174c88.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 07:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831374; x=1783436174; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L5Lwhy4eroz9T1Ks9h0aC6xjEPwY9tHUk8isUGec8O0=;
        b=BOf5om9HebjwihWv372lEh6+dp7NmBwWjvquZa5k5CN2bFil8D621H1efjT1JkyYE7
         1HvKP/LGR3Siyv2JsYOBDeXBuWzqa2LXNwBfXKpR5/e0hWIuDfGmYrXBtmXBWB8oibyP
         wKf4bAy9lrEPbTXji60XCpowkPs6KurMuTHE56xlZ+i9c9pHFwusMEABB87F11gnMm6I
         vGXJxL6VzNsq5hZLhFeg2XTPBMuDXswg/RV0M1hVQUsCfzuPs++YWmze1bb0rkrEnmmJ
         pPqpn36GBMVctd6uW0IPbkBvTC6SIeAAKwPiwBxYqsdYKMWM3Po8/r4/zzaaIA9R2OyJ
         amIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831374; x=1783436174;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5Lwhy4eroz9T1Ks9h0aC6xjEPwY9tHUk8isUGec8O0=;
        b=pD4eeX1hC7Di/W9+GvkcKmY0yIDLceb+7fz3A6jbDKhyU6L52dJEtSQ2zdL1rlR4ze
         6JjOAnkvpyOkQFGC2YEhStE/W8u2fTFHbDV6M30RdkMHj1tbPwozYFBoZ/tQQ1ivQKJo
         akr0JsQ6tntoQnf/RER8z5j1hQAsNFMfGALAkxocC//4QwVpws/EAyFTaw45hE9byIQO
         2a6Dor+aidlJ8H3ybY9pXfuo10PqiE/l5PWpfN06a0iEkXB/JXCdkZYdXYS0plxKIAQ0
         6960Grfcm0v7TfR/detLb1bs0VjScbeTzMEiMshySmhr8jEC7728ysyZHnJMmqT55Jdz
         qoUA==
X-Forwarded-Encrypted: i=1; AFNElJ9sEDUqQx+vjRrsH0at3P3RT0yqewcGccZ6RQ8naqCQCgCOKJZKYO66sUFEBSqbzOi3zEgwqcM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhyKNZCGO4jfVZz2Pd61s9dJoGcpcbpweA4v/7MT6070mZeQpe
	74p9/UL5b7IWgPKYxeu4GxBjf31NROFAzfaSISr+IcXsuwuE5N9O+yJot2ApKwyHjza5pJEt8SY
	xZV3+fX6+WLynujt3bXHdQJfqOUXDWCWoWHPOBjDNXg8j3z98bpX66xYd62yfBLNz
X-Gm-Gg: AfdE7ck4xHZwiEpqU2U26s9tfDpUzhSOzKbxT6Y8IdTd1E75JOcFCcCCGkO/YwqXe1p
	gW1Abz+VHfRYqUpK1FksrGND0Jz9iBzs1S3d54clvKqTymVp4tMUwIMSfSOuMYuz6VY5F4QdAKE
	0ZEy4Ax3IgTqc4OFxvMgvTEQqH/T4PAhPfTSCn0cWC7COQNJezsoA5a2/Kmzjguss045hEbaPXU
	o7CaT0F0r0cWmaf+/3+Gje9bEG2WnIeWF3CgpwYVMoSpHaCCdJ5wAFMnKxmkctLUG4i1GgoRxkA
	j5y9dv7ndUe+CRsNBkoAMAx5yIoqfn+Hooy0FnnZdIM8LRv0A+FbZG01xEqrZuw6/Oje2SB38MC
	1n523vfoA8kqPxxG3KYa4vCC620CNX8ireCPKR9o/kTBetLigF3mMAEZ8+XhOYBXrs4P9tMo=
X-Received: by 2002:a05:7022:672a:b0:139:ed5d:3b9 with SMTP id a92af1059eb24-13b2a1db527mr2558600c88.50.1782831373818;
        Tue, 30 Jun 2026 07:56:13 -0700 (PDT)
X-Received: by 2002:a05:7022:672a:b0:139:ed5d:3b9 with SMTP id a92af1059eb24-13b2a1db527mr2558575c88.50.1782831373158;
        Tue, 30 Jun 2026 07:56:13 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab21932sm9280479c88.5.2026.06.30.07.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:56:12 -0700 (PDT)
Message-ID: <dfc7b6a3-7c76-401d-bdd7-8f4a036c0ec8@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 07:56:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: skip unknown direct buffer ring module
 IDs
To: Nazar Mokrynskyi <nazar@mokrynskyi.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260505172415.566328-1-nazar@mokrynskyi.com>
 <20260505172415.566328-3-nazar@mokrynskyi.com>
 <89f30996-3210-403b-8c9a-52cf6d5fcb51@oss.qualcomm.com>
 <07a1e340-cfdf-4027-861e-8f2a940bd21c@mokrynskyi.com>
 <6f46ab6c-c7c0-4865-a68b-992ace4225d8@mokrynskyi.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6f46ab6c-c7c0-4865-a68b-992ace4225d8@mokrynskyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX7KsW66dWZ3oc
 opWHDrK03ehLAOjSaC4zPCUMIEEf5ClaWYE9R50V85sTSFw0h61rLm2eygtGxJ9o7P/1bKEjmcE
 l1lphsB3bu80EBbHU3fAmAV+5WnobVg0Ezb03dtOJGPRronlt/iZ7S5DtMScQ7qWXjnB7v/0Jgr
 wnwiknFwZxlVasWAVJmxBBV34PXV4cBY8Cv3eMMQzUQIA2EQOIE1TVuDIo/kwPqEkh/mHqBmPyh
 BJnXSP9UHFDYH0QG9MqqR2IhMFCQF+BDSQ2idb2h9TXhYR9a+VaEc/G+pK8gTzAimT2m8nSlz6Q
 MPLJuGT6S3wJT+A2UCxVlK2XNsHwWbqiqr1hGINLCtucOYyIK+rDhMsuYd/rQaV3fLz5AKqEmUy
 noOwtnWA7qOiaHXNZOF30bZxSTQoNmW/sCeVYUJEhsH3DogHxbH/PHYmOldyddvSjfkoUhkwxGo
 kDBx92OZLpCQU+6eJsA==
X-Proofpoint-GUID: 9r4NZFfnK5xUCEZZbQZE0kEZ9RuIwZto
X-Proofpoint-ORIG-GUID: 9r4NZFfnK5xUCEZZbQZE0kEZ9RuIwZto
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a43d90e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=LXdXwiECwZ2lVVnCtgQA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX6D5SKyh4QaUt
 6QU9NELt7oLppksBoX3YRFlz8eoOFbnMWG4P2dcNksn/qsVrdgn+tH9b5IXviLtwumUE3VHHOoL
 dI8AC3sLmMmu+89FVeChlYzM3WjjLyw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_075616_062829_251DB6E2 
X-CRM114-Status: UNSURE (   7.81  )
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

On 6/29/2026 8:52 PM, Nazar Mokrynskyi wrote:
> Anything else I can do to help upstream some version of these patches?
> I've been running them for another 1.5 months with no issues.

It is still in my patchwork queue.

/jeff


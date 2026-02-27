Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C16FD7F91
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0Zfgz7c8OWbFOK3XZczX8TwvU75kM+2bED6CLxjp/4=; b=c3G6roRvTHfBmSfl56J2P9HpKE
	jO/1+BVvcjJt1QkzwEIEfNuR/zXO9MSYjl5nTWaNoZymDGFEYViadAJYhHYWx3UDZ8iy9wHWN6tWW
	pJ06CNTBpGtFk/oBxcgHnagsj0MwmugRnIUopjyU89BvBs5/fzVhEBPlxqnQtg9KkyUeJK8T3TPyl
	mz/Ix/phBk8V+a370jdulPMb+IRfZcgr52md6tcSXpUUrROrSoBCrTAOkA923+XejCrJgC1nCDvr0
	9FqUs2SN/h3f1gkvpdYPe31cdmk0wSJUOhvWU2k3bOi974iznb67qsTtW4mn5rLcs3VMtlsOuHQvY
	t5juhitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvAZ-00000008F3V-2mKi;
	Fri, 27 Feb 2026 10:34:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvAV-00000008F2m-303H
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 10:34:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RA2WCp1600867
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0Zfgz7c8OWbFOK3XZczX8TwvU75kM+2bED6CLxjp/4=; b=nW5ZtIJvP11D1TIN
	Gu/zsW8eCRseo45i9GEcCQU0GNc6ka1LdvopXHxoAvDwulYK2r1XJKJCQmf3RScg
	1Bdpm5/Vh2IIubU+zBpv+s6NIVijIo/+CAANE/wUNhtDgEL2XX8S66CPhFd6TxVy
	v/q9/UUkbFZh2920Y1oeSqnmuSjcpwoRzlcUV0CSxUbshx7K71QjAbC/3JIfbh6k
	1y04JpcY3LsJqpEkCRX2/vgmpQ8iiIV7cGctzodXHf0MS/4l1IxgqcH8vM9ajHDy
	b5C+Ml1BWhsVmfQJYzTZVQRAhavMDsrV25i9Uxn5umQtw4raYF1Dl6tY0/vmPeKn
	whL5jw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99u6yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:33:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6e18b8fe1eso1830449a12.1
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 02:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772188438; x=1772793238; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q0Zfgz7c8OWbFOK3XZczX8TwvU75kM+2bED6CLxjp/4=;
        b=cP/WLXnf8XBle/ElF9EaZoqT56EtNAcp7TXyPyuYt3eZiVJuL40dE2g8dCCvmsfS5z
         OCGrCbYClRW6nOazPIp5QZteXf2wlLB+BU3EZLFLrzEQXtHnUUQhNfNG0o/pU5eWCMlr
         xFwb2EBquRx8W9tElb2Aly69aGEv+sDZUvBufDMnY/SM4PVmkFUsjc9QmgoRAsAOfE6F
         j5e7nJ3IK1MU2PYW+MVFxC9HbrdNRsdaUBA4bJarwuRvUSPgB4STWWN36YAgO5bf0JpO
         30L58ALEuAp4Z5qFSSP7HjlRwZdQ+rhGEpDJJ6z4MtI68I5X/++phw9dCr5FRQaEqCAE
         K0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772188438; x=1772793238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0Zfgz7c8OWbFOK3XZczX8TwvU75kM+2bED6CLxjp/4=;
        b=ZFTEY/db9ddEI12X7VhvOMMb/CU56ifn5UsHS17Ue3OKflMTkrbYuLyRp1WjyJ4z5P
         au1XIvaQU2fIGvQAOHSnmF1udNCLR+lW+B4reN+okCLVIW8Kf5tsT7rgQPQr1sZaNA2Q
         tvz2CGi1W8fE6slQYVWCvK1QRQmsRBzd5bkh2LUA6nJ5UxMXIJZZAa3tWUljlXNkVc2Q
         36CEKU55Y25bmFuQTjZRt88HdDrN5fsuj0YuJHl9kcIzpaHY1d1SweBi+zrcOlFGkFSd
         Lva7CDy7FYJb4Oa1Pmdht8RmeYYviRbaCoaEsJft6B1h+mdDRy8BoRaSjGJCh8Ld7bPP
         0MqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlHL7mZj0Orl9w5A1rBfFvKBysYePcK4Ob7I88j86PO0f6zGvAw4nl4vtYWAJPcMeN+Gy4jfs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPxdrQt3Qm7J5t/rRmooTXFx8ZHALPcn2azb2NuhTgJp0ksZW3
	nh+ZreMpBJUta9JhxSNXIrpkUus2DgPU5czNZdarGQwJDqg9HpykcU4687BWpAOWUWgelhFFrMh
	quV8709QjIks+O9x3zb8PIW1h7cGr8sQUNhhH8G3FNrlWX7Z1YGacUz+Fcv9GkyRM
X-Gm-Gg: ATEYQzzkdYZqJXrKfdlzayxpVZTyDokchqhq4u/d8DqDkI5VR55yvLRkK9uvBhJxOWX
	/Ha2ZqqdLs4v86/xqJlLRziV5rg/YBQW/aRBsu5EBvVrncwVaLY7fzr5sfLpOL07mnrwXfqeqX4
	fL1gwKae5Yc3JWxmdwr5e7MqY9iqHvjrERgbRXdAU+TFyvvN8rTuJ6M23DCTSSYf61JKhI2FkXK
	8MWzulGggw/HSSQukkbiic13HMJgrgWCFKTyyyDezeICHgixRAC422VT/CZqkMfBwloaYw8qj6r
	jzIqxiAqlkWetw7k4pzOyMsph5mAc6fcRnClEYlm2x7oxSarYhD3Nm2c5r780o7O7dhW8H+8uGB
	GGkHiZ0QlhPsk9IgSgv1CFuBF+nWKOsIwE9ewMOWZutbsRi0Xtv0fY62+GpUcWCrTTTU=
X-Received: by 2002:a05:6a21:1bc4:b0:38e:95f9:8cc1 with SMTP id adf61e73a8af0-395c4601a3bmr2254229637.12.1772188438301;
        Fri, 27 Feb 2026 02:33:58 -0800 (PST)
X-Received: by 2002:a05:6a21:1bc4:b0:38e:95f9:8cc1 with SMTP id adf61e73a8af0-395c4601a3bmr2254207637.12.1772188437735;
        Fri, 27 Feb 2026 02:33:57 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa8479aasm4533499a12.31.2026.02.27.02.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 02:33:57 -0800 (PST)
Message-ID: <84534529-50cd-468c-8a50-1503e6cf475b@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 16:03:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix the assignment of logical link
 index
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
References: <20260226041911.2434999-1-roopni.devanathan@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260226041911.2434999-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a17317 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YqZLIXxkOqM5MmwRYRkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 0eNZCraitzeAdWRGIp2DMe_0i1RUEln9
X-Proofpoint-ORIG-GUID: 0eNZCraitzeAdWRGIp2DMe_0i1RUEln9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5MSBTYWx0ZWRfXy4aOPafib79b
 u5atoCA+H301Ht64zitZpNtOAFdMMsXUpCf3n/sN6ptfy1YhSs2+IV1ZOlR3E2QThHNf/9FIBOe
 pM0YNTZyQ+A+K6nNW+45Dcoan2Uuo9zDOXHUK6HVqDFsC/jaujqZI4RIdwM7+84y3Tp0a3Bsy/o
 tWI/fNmf9Hc/SDEuJ1WXv4Ypety9uiMsOo+fiEEqrviy/eaZHXLS+f/7kLlpEW1zioixPib+bhA
 vwvC7hTjYqeYg4a1w7KAAGpxHGg74zgdDmyp+itxxlIp7SqUJs5NVMJ+mnwy1p6UElkfWvJSR4K
 WhLWJX6EbQ1A0IESnX02fIPbWmF1ORhJlezm6TfnhKADTtY4o0k93Nl2S/P4mhh0Tv5veML5wAV
 TNeI+OdI2W9WcveQXA6gzvCgJxxdGbb1oEXVgSzmTyCqnAqjnusohVsGgULK5/CAoEkxJB6PW9R
 VTDLXyJS9ci1BP9GZfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_023359_780636_8C6EBBF5 
X-CRM114-Status: GOOD (  13.54  )
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



On 2/26/2026 9:49 AM, Roopni Devanathan wrote:
> From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
> 
> Per-link logical index is assigned from the global counter,
> ahsta->num_peer. This logical index is sent to firmware during peer
> association. If there is a failure in creating a link station,
> ath12k_mac_free_unassign_link_sta() clears the link, but does not decrement
> the logical link index. This will result in a higher logical link index for
> the next link station created. Also, if there is a leak in logical link
> index as we assign the incremented num_peer, then the index can exceed the
> maximum valid value of 15.
> 
> As an example, let's say we have a 2 GHz + 5 GHz + 6 GHz MLO setup. So the
> logical link indices that they have are 0, 1 and 2, respectively. If the
> 5 GHz link is removed, logical link index 1 becomes available, and num_peer
> is not reduced to 2 and still remains at 3. If a new 5 GHz link is added
> later, it gets the index 3, instead of reusing link index 1. Also,
> num_peer is increased to 4, though only 3 links are present.
> 
> To resolve these, create a bitmap, free_logical_link_idx, that tracks the
> available logical link indices. When a link station is created, select the
> first free logical index and when a link station is removed, mark its
> logical link index as available by setting the bit.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
> Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


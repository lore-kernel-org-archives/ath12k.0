Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03BE606D80C
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QYiN6LcB;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SU6Cafza;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qia+1SCZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SJo7jnqF1M1rwKNOXnxitcspRC/aTbZyuZtyigERipk=; b=QYiN6LcB8FIhwj
	xDbk3jFMxJ0o8cBmmwGnu4ro1CZRal08Jbpw2a0isbi3P5hYre5ZCMGKuYoIiKk7Vm0lAdlCP2UWb
	/z8XsivA1ptJlz+hXLQz72CAfHDSrslinanOWKfCLnESd5vo6YCu5VOWBsW/YsKKY+fnoM+dAYNHp
	FlxXaAlic7eBNnCIpSdPDlhS1M4bVFvbzo5hCzWpIFEqqF3EcRXEwWqhGGbm5Ato9KeTZt8OcqW+3
	GJSSnLm/jCxpfOndMMXQ2/LDcf9spFQep/xJ+g1eKX/LK6nU8A1zO7n1JysxhOw1Mlvi7yLtM96ct
	mb71Do7YtXOGSuM0KYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzku-00000009SUd-3Lvi;
	Thu, 05 Nov 2026 15:52:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzkp-00000009SSi-3wXJ
	for ath12k@lists.infradead.org;
	Thu, 05 Nov 2026 15:51:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ72O1008639
	for <ath12k@lists.infradead.org>; Thu, 5 Nov 2026 15:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SJo7jnqF1M1rwKNOXnxitcspRC/aTbZyuZtyigERipk=; b=SU6CafzaJUVRtnA5
	pFTLGbVhd67aGS4mk+XjjE9pYfdBXf1FB2jB7PKf1AIcSsOHxaHMUvDphUe9B3De
	X2fyp+awX++0LQCf+B5judTxia9K5H7Ey5u13q/NcjOAG5NPfQGukQ1p7FdvxX3L
	nGUto40dL8y6CzF+xYTrSa7SUv0q5SKNNNHvrA5u/3IkjwTmNm6cU89t5q3jVrWa
	EmafBGunumXmce+1Go5Ep7WTesWeZrsjO3Ue3sJ4Y9PhjIK/p1YTqLcm54ghbIFC
	TltEI3/XRIXZVRFdFlRed3uUkb91RHlpwBn2erYlYpT3/UnIuVfrX2wHa1pE+D4T
	Bomcdg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v2d98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 15:51:55 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-821de0b7baaso2579657a34.1
        for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793893915; x=1794498715; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJo7jnqF1M1rwKNOXnxitcspRC/aTbZyuZtyigERipk=;
        b=Qia+1SCZHdwupGo0bcyksnBQXP5FtkmvO4rXqqKgYW5PbCXBGrjdy7Umky5EV/UnAg
         lHcpWhle5lGNEVeVqy3JtN/elALlfANB52lxRZEIa1L1SR9x+GUiIpwsVFRBpGN6egRu
         P/s59/80xvCmwUoIAKm4qJ3Xc8z/XK6gXarldbgIpGwLsynX7ONRYcjzT7gtDN+no/C6
         AuyTIBwkFNuUuP9dACzePafEgMcu6KLNRBqkzWcGl2LWzYHRqts2kx++y6YyHTZZAMpd
         UmoT7c7bcFIyw39jKdkefshyzM8J6zLXNEWXR3B2/tXpARy/bc6vO4L4GKsJfzNodWif
         bNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893915; x=1794498715;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJo7jnqF1M1rwKNOXnxitcspRC/aTbZyuZtyigERipk=;
        b=Y5rLZJZGmPXoLXWbe7NVs/VWJRuP1ABiXYn1mQfuTjQ3len86Dbztgy+paBrlAC1XY
         3x1D4ebxg+cV/Ac7r19goI5mGpiXT/EiyV7fokyW/yM4C/v63nemnVCFiTnlkSMI+oaA
         lqD/T/tNjqVR6fI7CoptaRpSVoOBEerS+4LgDjlv5e8BB5ji3KKeVSIPdDH9vJA0Aky3
         5sYf8NqearS7xqkT/kvvuUAnKmSAnn0rI467takpqhyB+nMnzMEhzGpffzMqLz61Rmmc
         /DLXw8B5WL1DaN2SjwIvycVe1gvrEMrifvMU83+Ht5qiXzuRhYdTOXZ/UgQPW/cukIKV
         lUpg==
X-Forwarded-Encrypted: i=1; AKwUvBzbjGPEh7qTHBlvRQ0RmOxZ1BCArCsfQNtjZBWE8sZbu2HGBa/3FxrX1HNEAMTMc0UDsekcDjU=@lists.infradead.org
X-Gm-Message-State: APuU4Z9HUeiyFbVc5v9fUDTRAv/qjGbhoI7O471zJaNC8bNLFZEnUZ3r
	AYIm1D/Cupt12EUbVuVmj8XDq8dWh/vrBayaAS0l4P/IW+InZfsQY2gif7UWY0DtHfrIeCSe2V9
	usgnxUwBNWoLeobCI72OVQg2rl9lQ+JO4t8h38JpGDnlSjsFN8KTZMzcohruYqUtw
X-Gm-Gg: AYBFou3+6MPzbgOnhQq70BjA7lf17Gtu45M3YtMd36nf9sz/S9xyrdj/fuhAXtmouuX
	k5QRu5RHLSbAGcgX5YfYwUIycfdtwswKeR6UPXkj0CTgckWOJU7Ejdpg1BVDuBVRpTFUpmFmGxS
	BISdTulCBe+ATKUN+L8aEd+W7nDWR3l1zQWrV3HwmWG2cJ5rZCWRc5pZl7gulP2hzwt1Jb4NyJj
	mhu28COz0cIfYWU8562hAbcoviJGgy4C2LzNbr62fDpOvsMMC1Sh1wkeUzDfMZi0/Qdlg6X3Ep3
	NdX3JkpRqQigBv0BJwBqSthC30OsPqce0ZebUC+Rv+GApWLU/S6Y/Aesvnd2COkDFliOPXOrb8I
	kgz1ywnfgGw5UgkxLLb7Cax+dgiwXSqwX8+JZ5gtogJJHwasdz4W/ErGebfjDAscvoTs+q/bPFj
	Gcljm2P+cDAk6uWZPSRCxbGAb9DJLj1w==
X-Received: by 2002:a05:6830:640e:b0:819:1804:d208 with SMTP id 46e09a7af769-85d3650b7d4mr16481904a34.13.1793893914688;
        Thu, 05 Nov 2026 07:51:54 -0800 (PST)
X-Received: by 2002:a05:6830:640e:b0:819:1804:d208 with SMTP id 46e09a7af769-85d3650b7d4mr16481875a34.13.1793893914117;
        Thu, 05 Nov 2026 07:51:54 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d7617asm4814965a34.4.2026.11.05.07.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:51:53 -0800 (PST)
Message-ID: <18053a92-36a3-4d02-bb73-25e9aacf976f@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 07:51:52 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20261102
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <8e38f8dc-88f9-4974-8f98-687795fb360a@oss.qualcomm.com>
 <61e49149-5096-4440-b261-ffe2d250f6f4@oss.qualcomm.com>
 <6792cdaa627ba4755fd0836a74474977496f9670.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6792cdaa627ba4755fd0836a74474977496f9670.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX4vwHH9iaCGFC
 Xt1+9UPuXDqNwR9kTp0yUzLE8aCE4P22EOvw7DFmzXw8xrZMXHEX+TYws1fy/jYKpjieq3GfKTU
 eSsX9aYbD8l7WT/d2EIh1QGKWK6J8SE=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aeca61b cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=5KJ2qN9qyuHGAc2nJd8A:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX/xmB1/Ll3e4Z
 LqK+Bgiq+7uCXrWX1sV/K1SzbexCZpwSLkstsc0d6aoMWk50WFZwJVlODwCV1bzGu/0veDnZFAf
 4S0TrmAMHzkByDePvavOlTOUbLytwKLfRkTFdbk5YbFjAsaWn/RueYLXe+RCqhJeFWr6LjY5oBl
 fTiq+Om5k6YlBp2H4UTaL/cq2T1/JF8raRiscguknR9cz3/c43xSKNXAMIn4NsHro1A1zaQ7vBE
 4sD/U6eUKrRfhJ0ICXhD3yR+GTFrPBplrLY1iKoZHiiX6dImNbugTn98ZCemhezjw1OlcLcUDLq
 lMt+/T7N1v+Ka/82FFPf9Lp0cVeKu+BGvAfEfloQjP/0wIK+pqWzxaz8hPH1ZQgTyvETvK08FN8
 /N66O6KMZH0uvPOlPSAOE6uMnkd8+TjtBjIgzAA24Y+ZIPzgJOOrX5JF6vTkXQg2erT/wjkTkTX
 MG2h8Gg8GSozZPbrigg==
X-Proofpoint-GUID: M5bXGKLgoVTQMOsz2mtl0GBhN9MxzmN5
X-Proofpoint-ORIG-GUID: M5bXGKLgoVTQMOsz2mtl0GBhN9MxzmN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_075157_433751_46E2B059 
X-CRM114-Status: GOOD (  11.96  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/2026 11:29 PM, Johannes Berg wrote:
> Hi Jeff,
> 
> On Wed, 2026-11-04 at 17:11 -0800, Jeff Johnson wrote:
>>
>> I missed the window for your wireless-2026-11-02 release.
> 
> Very narrowly too ...
> 
>> Since you have now
>> fast-forwarded I hope you can pick this up so that I can also fast-forward. I
>> have a series that depends upon a revert that went straight into Linus' tree.
> 
> I did, but I was also going to wait until net lands in Linus's tree,
> which should be soon (today/tomorrow) and fast forward again, so we're
> really aligned. Hope that's OK.
That's perfect, thanks!


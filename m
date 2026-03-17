Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB00BFF6E85
	for <ath12k@archiver.kernel.org>; Tue, 17 Mar 2026 21:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=; b=UM/hTprfxoJzeX8Rjg6882UuF9
	Gm8aqgQjt7oj2B9nnXSippaGxffcD6iiLDvpN7guTgTAxNND8Rna87mYgWUNI5taMp3+/PFQ8r38p
	mlVq271usJi2tmNgWKiac9uXfV0OK1ra3xQYhvMkWrflzivfnR/LvHTEZ+wfypzJYNkZ0F036omuM
	vKSkC8V101/UHLVE5G3o8lUunem83wAHWSswv0XMUt42ON+vUj+BO07zwqOeMdO0YUsbPJlRR3/WN
	52m5p6FNswJDmp39fh58+py6dJyrb38wZiqNJNV37IO6tTHosmVYn+QbFpdeMOvNpQ8234sqxTpyZ
	C0LA+hHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bpT-00000007Ewe-1FsR;
	Tue, 17 Mar 2026 21:19:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bpQ-00000007EvV-0xiA
	for ath12k@lists.infradead.org;
	Tue, 17 Mar 2026 21:19:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJm0p1261069
	for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 21:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=; b=U4A9jp91jXJEnARF
	xCpT5KTWmJbVolgd+qrizSi+kJ5qDiVJzVlHKEGnkxmAco3RI4KWwCNOAvZdQ6Ie
	cjyhcAZyXT8naCLLpw61q6p7124mSHr8fqJdPoMxHfAgShfjWbQgO/TZMFZo/jaE
	otu1XjhAVA2zXzlOCKOve4Y21ywKl/xrs1OSNX3GjxXH4bW0agSyTr9zFtFx4OsD
	De0eIfsSdoBo63SgVRRtSgrFtt8czC6XfJChbfHBF5Z6v0PLGYJSKELp+xKmx6j2
	uTpm/3arTwpKuCAIoYSOBozeWGU7sdqZSq6whf2C/77SG0N272ziuhOA73kebwOW
	oth4rA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy5g8j9su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 21:19:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0d15416b3so24009144eec.1
        for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 14:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773782390; x=1774387190; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=;
        b=ELBBdtRfRUFwmomILHS9mocqbf6bAJsFRXtdmFtpARCdgRVpNiUdfddmQyG/AKxQBr
         vszU4BEmK3g2cIliPw5DTQ0TTgETUaIzCJog62vcLiUhbEhJDlDncZmDMWCg6BKMmGyp
         kEYUJR9KTXHYlYdWQLwqEXT+cineUdVLCJ4uKXbY3Brr8VYKZiIpkBjzPB1dGGP6ULYb
         UpAxiMED6OzRBwjpH2OdzvA5RdHDkNGOQ5OLU8Zw57BZqxs6cLvP6atF7p2lIPnnPHre
         xawIXWH2wkKJroMaXFEYCNS9SG/sl+rlbZVBXSGB9rxcqksYazgXgXM2lvJ9lHVcah4t
         u6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773782390; x=1774387190;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=;
        b=GH4uQS+rJSSRmXL05WXC8O7UrnlK5n4KcutYPl8zI0YGKpVEbtPtEZQfaOdewy3FR5
         wNtHsY8TjrMr1QRf+P3I425N4EvWAGstFJkYa10wpEeCcLbuaHV3rQ2f/oUpLB5mOmg5
         gTQ/IT0BQZMdBtoH0sMevlq3iEC7KXv6bCy/m6PT0gbBUMc4tiAriSGsOnsi2UnWsvbF
         YpEOJH8aGKIKE6XouknEYXTtfhQnnX5BF7+pVM2EG/KUU1705rMGg2CJ1w8TsNkDwxEC
         KVMUatKgGYaQppSfhWdjBC7s9GHnb5cMZBARfmqAQyOdWq4kUm3t0Bh0epy3fcVtT7rm
         Xhcg==
X-Forwarded-Encrypted: i=1; AJvYcCXjGKvQvb8mrHkOVcehDWoEiX0BPrm27eoOusfQW/8HUel9c3bM+O55n6LUAZIRCw7yjpcO0NM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyoiAsp2uLILC9xN70S98cR7yn9z6sd5O46uvZ2SH9j8rDjgV7p
	KUd8XvcL1cnibdi2+7CaSRV8xvQvNsK1Fa5F24h/waD1GgqCC+TmDcCaplS1+ee/lFRcVxU09Pu
	KzXQpojzicJ9PYuBX5/l7x9ubdD6qUjaTIxIpcBdVNTXWiLYursIHcTsXpeoO2s69
X-Gm-Gg: ATEYQzws+ODMDTxVIWMotOdRnTZ0eOWsUtne/ievWe9t+WOiYU8RKWKjijtDPvN9/fn
	mQcrzoZjbxE1aoPwQgSyiW5sZtMHnhIKhBNHo23d1uofUdSI3UOuaTUFCGemsGLD0NW1vqmCTWh
	0vXHPkcuewMUgrn8mXHZMoiXOip1eNCtQcw0D8/0k8i4ipp7SGRyoj2oQZuCT9erTyd+JHbsRu9
	369+BsT7+mtjF3JaqJqwKAL+pXh2cL4d+o+uoQmoZrisUDntWdPE2J29pNKuYZFpxpLc2c/E0eQ
	q64xheWc7tB7VqoDpdmGSbtuqNdSt8MTlRKOCCcWECy3BSfNEIxxTxnIt/OeNFZrTA782Yv617q
	ko8tH/+uSeI3O1pn7UZiI+RM3VraX8pftx5odlwrnk16zHNvgfulv2TRY0o7zYjCXWdpLQBRQEq
	HJc1jslqDlVVaVqA==
X-Received: by 2002:a05:7300:fb97:b0:2be:9886:d4cc with SMTP id 5a478bee46e88-2c0e4feaf75mr548370eec.3.1773782390465;
        Tue, 17 Mar 2026 14:19:50 -0700 (PDT)
X-Received: by 2002:a05:7300:fb97:b0:2be:9886:d4cc with SMTP id 5a478bee46e88-2c0e4feaf75mr548358eec.3.1773782389960;
        Tue, 17 Mar 2026 14:19:49 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm970898eec.30.2026.03.17.14.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 14:19:49 -0700 (PDT)
Message-ID: <e22e4dc4-a98a-417c-9b18-8836ec56ff56@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:19:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260317
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
 <sxyottdaf2tu7swtvs46cziq4s7vraebrgclia3i625lnczf3x@bo7ssgih5mjk>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sxyottdaf2tu7swtvs46cziq4s7vraebrgclia3i625lnczf3x@bo7ssgih5mjk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mxakSg2kJMfAMkWdOKE152Lldobb1WsQ
X-Authority-Analysis: v=2.4 cv=EeTFgfmC c=1 sm=1 tr=0 ts=69b9c577 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=Lpt2Xbyv4YudqlJ1IEcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: mxakSg2kJMfAMkWdOKE152Lldobb1WsQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE4NyBTYWx0ZWRfX7Qx3hu4viYc3
 0JT+fbQLrvCsSuTfNmqHhoeh5y1WAClOxbFwovuFiTxL/+UF71MIgvLtosNc1q+gZC8TwLg5QyP
 fRkIjY4q1fvfrXfnGGuj/tvRYoVDPsIC8by+q0JFJMqzPFbG0VjRHNfPJYqH9MO56uhzn2vkDqL
 fx4uNV8jZP5rRmOjK/eLJHRD2kL3hAGkxqv0AsuE3ls4TIaqSvJ2mtqw92ZVhHzSlVjlZvxoMDk
 sQa/VhNLXqmmZ9/0C/Bmf8oEZGopfaesXz3WldJu5kB8CLSkrwcF1kll83RAg0J5Gcl8VOOGpcV
 P3xCYLSuEZbUS8smXKME3N39mheQifL61FJpqQP+rSGgchGJkDeJTy5++42x5+Gmbq76iBGdeUZ
 BLYx3M1AWhXUvKoZfVTIsZJF+UGitGLuQiBGxz4U/EiZ2tKZl+nRYxIz0g0CYZpFESuVmNionhI
 id2uwIsS0bxHIXDgMvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_141952_300308_3A950CF8 
X-CRM114-Status: GOOD (  12.76  )
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

On 3/17/2026 1:58 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 01:18:59PM -0700, Jeff Johnson wrote:
>> The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:
>>
>>   Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260317
>>
>> for you to fetch changes up to 6fb33265936075ee1bb5a31786a4fe1b30fdd001:
>>
>>   ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3 (2026-03-17 13:07:48 -0700)
>>
>> ----------------------------------------------------------------
>> Hi,
>> Here's a new pull request for ath10k, ath11k and ath12k.
>>
>> No updates for ath10k or ath11k
>>
>> For ath12k:
>> Update WCN7850 firmware a new unified firmware supporting Mobile, IoT,
>> and Automotive.
> 
> Thanks, updated and pushed out.
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/962
> 
> In future, could you please include similar information into the commit
> message too?

ACK


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE3CEE36AE
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 17:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcYo05PZlk2AUgSB7V9lX1yVEW/sgbKI2PL1ZdsLsc4=; b=v4uxGXp5usbCQY1WHUhxmItIfX
	oFltJqRfpFxjmuGBdeHEBWCIoGBriB8bkorGfm1UkO2HvOQYV8zLsnI3/4Dm9waXmYbZ6jwOwSIOW
	iJi7NBi7Rwo1Eh6MG0DQn92iqceWJDVMI93aaL+MUHDwUwoaTcewDebeUIMjnqxKvDChTt0m91BMx
	hjUaLIPB0C/2Z/gwYNycpT+qheWd0teerufmLZXlj7JhtQ3cEu8vQPFyIe3wteMCCqbEug3eY/6ip
	jjNXtuX/qYUTbKYAqwd9uPspd+a26OjfJT8qSysIguslxm2+RNVaAFnlJ42B24+tA/DmFlmQv5T0/
	ejG0TXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaj0-00000002Sx3-357f;
	Thu, 12 Feb 2026 17:43:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaiy-00000002Swe-1BAz
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 17:43:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRgJ63943718
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 17:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FcYo05PZlk2AUgSB7V9lX1yVEW/sgbKI2PL1ZdsLsc4=; b=P/mbQe+oijh+ghJ4
	8UTjqIhcj6qWAl9QVWiUr6Uqgmh05/ITnGnSFK08lSE7B90YK5t0WPBc0IUMkt87
	o1dEuOmkROD5KiZei2PEcuGIMvconMKu9qVZBsKtLRpHKDMJrT55UJcgOuFbzrDX
	/dzw4tLyd1j9h9fnw7SXbJGP83xYtZNy2FVTeBfG7UE3Ldx1D/0DSCFPRxnAj1E+
	2IsNkWWsZWvtePXekfeleKMkLf5FNdsis7mD1QnaEbf/p7r5+ICn3h23k2N79hWU
	hQZm5MYCePnFl7qcQ26WQLQSuBIkYUs52h0SrPwHurVa7ZaWoMm8IBruhzw6VUM1
	Ij6coA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c90d6urda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 17:43:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3545dbb7f14so149148a91.0
        for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 09:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770918210; x=1771523010; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FcYo05PZlk2AUgSB7V9lX1yVEW/sgbKI2PL1ZdsLsc4=;
        b=b+fq2RFvZzErrIIMr3/6Rh6KjIogzKfgX7miyQiBlgirjh34CjiGwtw9eQo+gWo8PV
         x2jUHJE7YsQiJ+Eysh1hSW+26nsqUSLu755CVFzCTzjzbbEaAudPyGktOp3iEpKE2chC
         8/np+/bCNYusOuzEbyHW8zAFAGNlcvllbZ4bhKTczi3lN3fRYtLmhUo4Tjr1Ug0l3nvy
         1W6gMycxzKRu2fxADcNqO9p7Vex9wjZuJuUNUxJzOcjDH/iYJG9/mFGUNKFCwP2RYiSv
         w44VTyhyFYQFRzm8zLBRq6NobpqP0G+RTJHF2mdGcUjGSM9Y0x8MsauZQoTRHFcLR+XJ
         f6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770918210; x=1771523010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcYo05PZlk2AUgSB7V9lX1yVEW/sgbKI2PL1ZdsLsc4=;
        b=OPJBxUk6JJWcorJUt2lLAQ+RtF6YQEhLRx4uBRfvLT9NzTyy0MNzdKaJo2mxoJGmqy
         WV9YZP97+G62Eu/HVDlNSfizJHi0s0hgpZtH6dKepH6f4M9PFmi3P6NdXWgNG2BwdBNF
         zyoQyrPliVuzj7WRh15GhyDu3YlIRGr5mGGpewksWxi31qSkfWN+ta3JpJmzLHIUSCYx
         7yJCnkl1/mgrh3dtYHuz3OgbRLaNJTEidpLxoJQo5tP0XXoP3Y/x7hwSySVpbsDmJmH6
         34ZOLzz9VpWdxYM+K3UCJV+ZjRzikYbmMrL48X38TYAy5wKn8z5/uI4xa/61N0fXDDyu
         S2eA==
X-Forwarded-Encrypted: i=1; AJvYcCUQeZi6rKUYAY2rjI37jQu9s1ZzuyyoWCSvsP5So7zfyELHiFuxES0dbuKWxy9ki3fkpdWr92U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzeru97Tdvh+LolAAeuPc9Z6sMiT0I94oawE5giKCXX6DTfttUR
	Po/QFy8coovP6gK44YCm/qB9JvnFbbdxV3WkYyFsQ8LtxMULs5Pxdw1PtekBTOFXe9Ld42UH72y
	DjI6I5p0X/4qJFQQm1LTnprZ5+wPWUSRi567eEGs01GOQ1i7KhjNeS/xhC0Q/opPU
X-Gm-Gg: AZuq6aLgw/Zk6kHaxhEPASXGHz34J3NMNRRD6hm7UeRqLI5b9AbWmJk4R1KFDp9IEVv
	8X+5FOqMCmF4QVNuY1Nb9v4G71eZbAxRg4jyWQnZbCJLrxWCf1oQJ8175QtXfHrLh0qN+S4Cwpq
	aWP2MSsiLLh7AQZCU61cFl6+5fTiEHK3kU3KY3N4sXaQbOtreDLH03E+mJe3xHtfrQgIeHneFLv
	3shHZQjKBRMYZbmHvGoAYEOTOQ/YFOx3TAzyRDZUF3s7Fn6nvy6iRqv4dE/TtvE0bHIYV0Ddi1a
	6aJucT9M0IxgCuTJeazXBX+Lp1fw1cB8/nDjfv971Sx8KlDQgD36Cblf6HsMS1tUZAyxe2EAmv2
	66wxRpNUNQLtF3SWR2FI+EdAQbXvQMKmK60zq9Qew2GmRzRJLRMx1DmwxfXxMXxj2KOFtJm9kHu
	+6JBejeAn+1+U4xeMVjaPRtQMaB6RsgJiF5K3NN2pkUcKM9mGlwA==
X-Received: by 2002:a17:90b:548f:b0:340:e4fb:130b with SMTP id 98e67ed59e1d1-3568f314b04mr3222993a91.14.1770918209492;
        Thu, 12 Feb 2026 09:43:29 -0800 (PST)
X-Received: by 2002:a17:90b:548f:b0:340:e4fb:130b with SMTP id 98e67ed59e1d1-3568f314b04mr3222973a91.14.1770918208994;
        Thu, 12 Feb 2026 09:43:28 -0800 (PST)
Received: from [10.50.42.130] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567e9dff38sm5670314a91.7.2026.02.12.09.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 09:43:28 -0800 (PST)
Message-ID: <6e9ff54e-dc83-46ad-8415-5c950d6c4444@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 23:13:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v2 00/02] wifi: ieee80211/mac80211: Add UHR
 (802.11bn) Capability and Operation parsing helpers
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260212172401.234059-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <c9353b48d4efdcdfcd46553e83a8131869c08b49.camel@sipsolutions.net>
Content-Language: en-US
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
In-Reply-To: <c9353b48d4efdcdfcd46553e83a8131869c08b49.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 922zSeeV930CibAHEiIaLPSwu0doHH_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzNiBTYWx0ZWRfXyrwsR8AKqwu0
 IW0u0N97kmOKGWnTdjOwhHWudrK2woZ7qXTxG2KD2Or4LGymKZ+HC5xaPM6NrxzzXKj1yQnBLUf
 az5LPD8mqBBbw6p3gPP9SyYnTegYssTrZ8i6SI0u+TDbpbdLshTbsEyYJ7N23z8DwVmW6/xRApa
 sfF84ZX/FdQ/mTEof7J4r6PTvd4MhnEF8FyYiTBZHaFFMFcVfruKqOYB4SQ0aCOaRmyhwMBXf+t
 utXUXtvkxejJqXShGUeZ1Indt6PBxdyeFjgHob5ff0fm37wVjIX2t44BwBFwDvom49RdWpeE8Oq
 oJUfee9Ni8VYcu1RDaF5Vc+9/EztRTytrV3OIVCS+A7fxk2gpI50qyBVg6NBSR85jYkuabJ+fgD
 iGcRtyROQH7FwoEMPlwKagDnN6B+jCYjDSU0nAXInehAhSR+s9V2rizrdCGtxHiqg48UwnVd8mu
 s+xLUYmwnMeBv2HV6PQ==
X-Authority-Analysis: v=2.4 cv=ZaMQ98VA c=1 sm=1 tr=0 ts=698e1142 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=GiPjJN1dBy5oX2_y9DcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 922zSeeV930CibAHEiIaLPSwu0doHH_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_094332_443007_A130D2F9 
X-CRM114-Status: GOOD (  14.07  )
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



On 2/12/2026 11:06 PM, Johannes Berg wrote:
> On Thu, 2026-02-12 at 22:53 +0530, Karthikeyan Kathirvel wrote:
>> This series covers support for UHR capability and operation (11bn)
>> parsing helpers for DPS/DBE/P-EDCA, and adds mac80211 hwsim changes.
>>
>> The code changes are based on the IEEE 802.11bn Draft P802.11bn/D1.3.
>> There may be changes in the code to adopt upcoming 11bn spec changes.
> 
> Indeed. I hear Qualcomm prefers 8 bits for the NPCA primary channel
> rather than the 4 bits for the NPCA primary channel (offset) ;-)
> 
Okay, I might missed any other thread if this is discussed, let me check

> Anyway, I'm sure we'll adjust this all eventually. I just wanted to also
> say that I'll try to post the NPCA changes I made soon, where I was also
> adding NPCA to UHR capabilities in hwsim, but that doesn't really
> matter.
> 
> johannes

Sure

/KK


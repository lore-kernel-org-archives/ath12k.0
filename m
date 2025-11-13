Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9209FCD4F35
	for <ath12k@archiver.kernel.org>; Thu, 13 Nov 2025 02:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fODHwD0ztzkMI6TyqoDJPKTSi40CPsCEBaOf7CEyr30=; b=LkIqnIArmfaR4loqdpcBzoXt4h
	kxi8hEQu9frRUgdjhE/mGDuwlrw8nKM3MsW4Mcs6GlysXqKIfospt4LikfrhsQoy6AhmCe1Y/Mfdx
	++NB4ULcqbauvanfH/7cB3vBSBKQMv6+a22v5S2PTxYD3+3ygwuNVtUM8GsLpx3L2jxcrkWHz94Tl
	v0ACYpmWym+fPVDo2tyayuo+G8u/FKLtIvff6yew9vjMzKqKBnBsrKCd4FZ7gzoMr2/NrexQPKrSj
	A0wDT3rtqcTc3BtbRG/e5fY7HxaJ+LHFD0uBLvhe8I4G8/ecHSNu6kijpaWWvYlUGZm0fMtyvNgar
	vgWhn4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMfn-00000009mSE-1R5w;
	Thu, 13 Nov 2025 02:02:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMfi-00000009mRg-3GID
	for ath12k@lists.infradead.org;
	Thu, 13 Nov 2025 02:02:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD11Oc92993501
	for <ath12k@lists.infradead.org>; Thu, 13 Nov 2025 02:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fODHwD0ztzkMI6TyqoDJPKTSi40CPsCEBaOf7CEyr30=; b=AaeERA4LNLKzvfgp
	yBYsBzNX9xktoicGsB3zQU/ejg4YcJLfDalrSdFpPEcDogEurNAnh5ZHTz9F6pZ9
	mc8bKqWGcFALJxhrR20b4i2VQbyzFchumLei0cJtvaCAnl0Q0T34ZSk6jXdY5HHV
	v2q+PPB2IcqeN8Y+JkTcyCXYVhChy3A7cp8XSE0XtEAUaxU7/byYznwNjryiEJLu
	GNcQhDXOyOZDmiUJOnz63gordQEIb7gUdAX9xOOQnD+TmAUwHdI18mTIvQdVrpEP
	xy9GzL+icT9UxEs1tI2LkZEjBffxO5TXsGLqvG6ggssQ6Wn+WHwHwvPtW53KCGBR
	X7ie8g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad47jgbkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 13 Nov 2025 02:02:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3438744f12fso819691a91.2
        for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 18:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762999368; x=1763604168; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fODHwD0ztzkMI6TyqoDJPKTSi40CPsCEBaOf7CEyr30=;
        b=Z0K78r+1++Igx7LOR3HccRxHeGSLCuvNi6UWadiEWLIJy1yGpXvibp6D3WxJUYxiKF
         yv63CzP9eNXKMAi2Lj9gIuove+3RWqetmVIA3tstI+lzKV3wd8mSRiacfG6CypqKsaFK
         UPwqKhbYI3s2/1mxB3yDFFcmDT3bClRsKwH95TA+c2ewDhT948gSwHP7jixhksQs1yFu
         SoQFEBmmOAsUQ067Mru7fUAUKrp9gjJtROzDOmAe1T0XCE72u2dyHnAFKaJAaZvGMLXz
         ENs6PgBOndrNBV2RDJQN10pDJtqj8ox8a25lDdQ8erdWoNzCewN8jDPLkKdnvW8XHvj/
         EE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762999368; x=1763604168;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fODHwD0ztzkMI6TyqoDJPKTSi40CPsCEBaOf7CEyr30=;
        b=L1hwLNh5OEK0oAx1x1bYO89TAfjV2QbDwOWIcIWxXe0rwadkonsHUNt/muYOu3Jpke
         l8YUcxs5CxeMI1BP329iKhx4qBlbIzA6epVzgTDDr6zizrflg41wO1MpHct5OSQdQUJo
         wMM/023rYGz6qKzMnTRWYr6hWlCU0pN+QXZY1A68fRBnU/H+zvEY+wPi37gFqyfEENxP
         2Q9jDTVTrwKEk81ulOqt/3ElscoJk0tO54GU+EaQEooxv6i+TLApfNJUZLWwqinP3NTe
         JgyPyoRCBkRXWsbI0xbTk0z+Xll3Ke6xjn6xH9nNXcA/BSQr8BXXIk2QRDqiDQy/8DOD
         Sumw==
X-Forwarded-Encrypted: i=1; AJvYcCV+dMYVkFO5oJh/lGZIny+VoutEG7tIjH5md9YUSvShuDAneiOMOx1dbNgr1SGc5pce6fUQsbc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxN2tMHdUpIczCFjhsGONDG6I6m468cuP2w+NdVSTfWYgJtGNog
	J7wUHZpbOysfCNIuvW17wGhtJ1XCj8iJduuat9zY5v38dAATtcsgBaXkwdUHm4SaVKqfb/omx2x
	BxxQ81h+43skrwpzrrPxuYyxcvlcW0K3kNpnXAhG/6HlqIENM0ifLZOMKgMOKLHnq
X-Gm-Gg: ASbGncssjJ7ExiaBO8lh1YV77QJvX2MEY+yfeJB7abNGLMgRWuuyCTNj127zr3Ftjcs
	42KJ+74E5Z3Y17GuA7AX7TPGYTMp/+i97VyXaBVN0SkeNZYkPhvpEQe+ry527K6C8e/VGtwyn+A
	d6jFoj1JKA0Js/vzOMLJ7jrCIaCNMV7qXNn8AG9otnU928U5Uud4lmd7PTltELSwUbZT1R+6DT4
	5v6YTKObcC6Jqoo2KSEiIPTZG+B2p38i4WiJx5TXs3E6/VtBe6QJ8oWBToig25Ewe91CqQg+Vg6
	D3bGAazFUVr3E3bCQi2aJ4AAhbka1F8q98HpNDFTjy5FPBxjpAdaeoKiZhw2Qq6MstzcP+VkqJL
	Krg+R5QUgBu52dVZ9JbCjWBm4fzF0W7SqCU2zfJJvrnHmYrZlqUgHnB4Y8lQSLD8a8In+sQ==
X-Received: by 2002:a17:902:fc86:b0:298:1156:acd5 with SMTP id d9443c01a7336-2984edcaeccmr67769455ad.39.1762999367752;
        Wed, 12 Nov 2025 18:02:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEImxnB/VP8Qx9zd2vsYFso7D8d9hSR33jzHVCM3+g/roIRdwkvNHIeX3uwVmofNg6YYSlMrg==
X-Received: by 2002:a17:902:fc86:b0:298:1156:acd5 with SMTP id d9443c01a7336-2984edcaeccmr67769005ad.39.1762999367195;
        Wed, 12 Nov 2025 18:02:47 -0800 (PST)
Received: from [10.133.33.9] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bebe1sm5313525ad.82.2025.11.12.18.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 18:02:46 -0800 (PST)
Message-ID: <5631a134-d5f7-4e2f-b669-70db5b86aa0e@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:02:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k pcie radios with MLO support?
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Ben Greear <greearb@candelatech.com>, ath12k@lists.infradead.org
References: <1891f4e1-1e28-4f30-b48b-fa50210135da@candelatech.com>
 <f44d00bf-62d3-427d-a70d-29e7e325b8f3@oss.qualcomm.com>
 <75947d00-4b0c-44af-b887-7874077fe64b@candelatech.com>
 <4648e6df-08da-9d7a-63e2-d2b850ccabb4@oss.qualcomm.com>
 <834e6ec1-0755-48ad-af30-2d6470a0233e@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <834e6ec1-0755-48ad-af30-2d6470a0233e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAxMiBTYWx0ZWRfX664wkJ1Xi51h
 +/Pi7E76kV53dRNb89YxxzM38LE8LllWwBIgF2a1IWiwvtpshHSugD2X5ZPgfGtcWozLeqSAR/V
 eu2iWtep/5toGvRXGd5M3BIGUMI9M7S+ImUMdAZ/4CrWvZt4I83+EZ68cS1EF5X0VcB23woYrQZ
 xnlBxR4TmCTHa1rNSczr4UIKxmdaaejz+fwSsNvP2mn32lJoIusGZ/aPc5hZRKxK2oc5ZY7AsYq
 hHwIPfAuWjwkDB6h0/VgwzX6NYx1xmLg8BkDb3GZ0+LHjU+vYynI8nukf8l3SRMAMzY0cy26DS3
 J2vefSUAuYOwQjbV1gmVPEHXfu18AIfce6pxBlqEatpaMDs5+YBIBwwmDeFyTVEmBL6yOOryf2s
 juYFvEZxZ7QmiUJ/nMUcbpLgqbicKA==
X-Proofpoint-GUID: 9z2R6VefTUeIOFsD0A4M0WnhXIfktQ32
X-Authority-Analysis: v=2.4 cv=A5Fh/qWG c=1 sm=1 tr=0 ts=69153c48 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GUbesZiWAAAA:8 a=XmvUqCGQ8xh5jYlcwwgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=-cUrBSrepuC47jtK_ZRV:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: 9z2R6VefTUeIOFsD0A4M0WnhXIfktQ32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_180250_944209_66036C1C 
X-CRM114-Status: GOOD (  14.83  )
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



On 11/12/2025 10:57 PM, Jeff Johnson wrote:
> On 11/11/2025 9:15 PM, Vasanthakumar Thiagarajan wrote:
>>
>>
>> On 11/12/2025 7:10 AM, Ben Greear wrote:
>>> On 11/11/25 17:29, Jeff Johnson wrote:
>>>> On 11/11/2025 7:27 AM, Ben Greear wrote:
>>>>> Hello,
>>>>>
>>>>> Are there any current radios + software available where one can put
>>>>> ath12k radios in (mini)pcie slots or similar and use those in x86-64
>>>>> chassis and provide tri-band MLO?
>>>>>
>>>>> Last I looked, Compex had some dual-band radios and maybe single-band
>>>>> 6ghz, but I am not sure those can be combined into a tri-band MLO solution?
>>>>
>>>> Most of the Compex modules use the AP-centric QCN chipsets.
>>>> For your use case look for something using the WCN chipset.
>>>>
>>>> Something like:
>>>> https://www.sparklan.com/product/wnfq-291bei/
>>>>
>>>> (I haven't tried it and don't endorse it, just giving as an example)
>>>
>>> Hello Jeff,
>>>
>>> Thanks for the link.  That too is dual band though.  I'm interested in
>>> using ath12k radios for wifi testing purposes, so I'd really like tri-band
>>> MLO to have some feature parity with the MTK 7996 radio board.
>>>
>>> Is ath12k able to combine discrete wifi NICs into tri-band MLO stations?
>>
>> Yes, ath12k supports tri-band MLO STA. This has been validated for QCN chipsets.
>> Not sure if this has been tested for WCN chipsets.
> 
> +Baochen should be able to confirm, but my understanding is that WCN only
> supports 2 active links at a time. So sorry for providing a link to a product

Yeah, simultaneously 2 link at most.

> that doesn't meet your requirement to have all 3 bands operating
> simultaneously -- I didn't read that requirement closely enough.
> 
> /jeff
> 
> 



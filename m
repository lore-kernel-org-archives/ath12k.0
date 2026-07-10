Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AD4C44507
	for <ath12k@archiver.kernel.org>; Fri, 10 Jul 2026 20:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=; b=nP8w2JGr4i3AhzWT47UDNTfvuL
	gMjbBS12nFJF6yc0NjRvMKDRIRjjvMAwrzBC0CgHVImK7ZyjsuQGWSugAEoZon1N6b4Hn/RdHvf93
	7va9PJoFfU7zp6sSP0hnbn9tgPcCLXcYgw35313eWANlIVK/fze8sScWVtBKrJYqT/ehnYb3ie7nt
	KPzlQWk6JVIkH51ZXuwSkkoGRLdnOmpCO7fXUvm3LSaozcTANKloiXjk+l4KLSZhgNHGsEHyrpT45
	eDQhtpqa1NfYRnMj4pPzDWwcuSrXRZsq7JuKnKpsJsk9R8DzoPVcT+sr27uQ9pXCH307uqwK3OSKL
	xtlRclRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHQ5-00000005dx7-21Xr;
	Fri, 10 Jul 2026 20:01:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHQ2-00000005dwY-1Det
	for ath12k@lists.infradead.org;
	Fri, 10 Jul 2026 20:01:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3pwu1450980
	for <ath12k@lists.infradead.org>; Fri, 10 Jul 2026 20:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=; b=ekx/Ir9KisQqT+sO
	S+dKYkRjkjB89OmCaMF97bUAQTE4ze415+U13BgRp71chl9J8OEjUDfECg6839Yc
	nrHU8OXQkaA3HRIHSAsV8zu4b9FSDGXSVoYE3+JqrgU63WAXQo7Y+LXc0Qn2dbNZ
	212MK8O2wSik+3XE3fyIz8kqOILZi9bFNmrGti4fH90kNAuOWbthXc1f5nzxXi3Z
	i3SUAjXVjvtmqxsJsvxaQjH7BE46ROkkYC942Ci3GUBi7ZxKgprf/NNh+C4N9Moi
	KcwsOwgJ4eWEKmHL0/2w+8WpmOwVO7wPVFc8npsdtlae8mdoAPVb52lzhb7gw2wn
	ZmWaaw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n3gaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jul 2026 20:01:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca3673560so20856885ad.1
        for <ath12k@lists.infradead.org>; Fri, 10 Jul 2026 13:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783713702; x=1784318502; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=;
        b=iNbF/UGw1/rGB2P7flknFu5rHmPRFqia6TvVEJIkwDdpytKTLgFZ8dLNVw3p/7lMLN
         Tc7XxGxsvdBCjdRFjC6B6Uje1qHxRgCpJTAJj9G76EyXarhyhtsTHUp+luOWPiUHrzv7
         2VwzxAHbmaXf6v9NI42Qc/RxhaXKoy+9cM4rOVqRGn/elAPkca0CPv4O8D9ofvns4/Qe
         pKPJZTXRk0Tb0aeCWdrsUTrxGLd1RnoEw2UbVSzufaNFKK8mTlXck4pXdbpRz3m3XsnD
         7aNZtd9JhxwIHcTNgMdQ+NnJAoFxBg2v7Jn2LG536mqeFdu1vklrSLigF8M4fEq8ECWm
         eNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783713702; x=1784318502;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=;
        b=scPFM4q9fO4SnZ7DV6TBaQsEh53xnzHGntKrMOEDN+lhz6K7hZZ0cw0AgmopKqODTI
         K/tx8roGqu9Y1jRrGVZbxTodYbDswB44aVOjaOd37ib+v0tooGn4C1FjhkEjxneg9/OF
         PA94IRD8HO3Jljvdklh1krvIh8gPANxtTpchSXiJ2MH1noux2D4mnLRmn+rUxSN4qiBR
         paPu0wsq9WvRud0/lk/2LcYvUsozk9UIUrDYgKV4P/AMvh8a3fb4sUmZMMNrHUFfmizl
         px96u1SiatNz9tr/I1ry52hB6WdDBN7wiBn4PImV+aUJzq4JIBBYAPwA08yvqEO0qQZ2
         4DKQ==
X-Forwarded-Encrypted: i=1; AHgh+RqI0gOC16+Bc0OQ3g3q4udWGD1Pz3jfI5GXeXSAXlDJ/0ED3ZgQVbsN4sPlQ48S3nryk4NRuZ8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuqmCFw4MhuxHnY+oCUbrKoAaKIQaksbzF95BwaGSXPoOm4rmT
	2JgAG5zetilyuE01t7lzpVSLHWIiyfQ/Ukh81fnJDZ5yzaddIRIX9aGXj5AU0lqdehIX8oLXpaA
	LM5nMBlWfxxkEXYJaFB5ftEHHvnUVmJrXlGrQophvxCiv8P9tawjP4yBa0APcNOSO
X-Gm-Gg: AfdE7ckTzkC5IGumIxM+OquPzw/L5U+kG6LET1NoocLT1NSxLsfPAR96y1DQRzwM9o6
	B4PNQ2nysxM/3rVUyV/gIiZemcyQzvtDAHLb/4vExFFvgU9zVEN1M0dbcopTbKtdPwvOodgKaOd
	0J2cyzszXGGDYA4UPJJsNXN5F0GrlfyUVD5caNCCaWFqf0froCzLcxplPp4lI84HFSyVR4YM444
	JQJIzA1DweW+285iTasr9pTis6qM0fDip9YdBCu21qfnq9jYpIRxl7+U4FPWP9WeLQqlpJAC7td
	LbAOddi+jGeyq9dJqjyG9eYYz84fvJnCYsdSXJkI0/zWCet81PGPCopA+5xM/LsXaL17cQ8pk2z
	xw3jV59t96WnidjtSOrDkwOyPw2BOurzYZT5HS9KpUxSNrRfKYsdfxT72ShCype7LyyDT
X-Received: by 2002:a05:6a20:258e:b0:3c0:42c0:702e with SMTP id adf61e73a8af0-3c110ba2a31mr439240637.52.1783713702113;
        Fri, 10 Jul 2026 13:01:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:258e:b0:3c0:42c0:702e with SMTP id adf61e73a8af0-3c110ba2a31mr439205637.52.1783713701649;
        Fri, 10 Jul 2026 13:01:41 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm50819545c88.7.2026.07.10.13.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 13:01:40 -0700 (PDT)
Message-ID: <3f399cac-d82d-4d52-8a52-45cd9a0e31d8@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 13:01:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v9 00/14] firmware: qcom: Add OP-TEE PAS service
 support
To: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <178362521364.2422497.1305957434056184382.b4-ty@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <178362521364.2422497.1305957434056184382.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIwMCBTYWx0ZWRfX9hp/w3/MJcbI
 f8Ak4lc/VlfCZ2ESZHidM3C+mIvqu/3FHfRAa0mK4Vk22z1j05XQwFbKx+8zuCo9iCJTt8l8i3s
 3R7CT0HKA84Fv5gLbQhE/1ykkw+b4LE=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a514fac cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G7o58nB-JDmhE5M--eMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: aQ_YB_tOvCSHEaSWqlNPxDe5sAFxL7_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIwMCBTYWx0ZWRfX77+j+auxmg7G
 hx2zI7gtHgeP/DuVnsGYz7d0nvXY+2C9IdMiVHHhoO817qDk0lAl8uEbPasosNQ4YeSJB3zo5ws
 C4tslqm2YAX2qXn078rc/Fbfn+mYzJUZXM3pmnqm64OP9xSw6aHQBWePyXPUSNCc1efcWcyJNAd
 vkj/224B/SvMEotXhsYxjOzMiXCa6jqgNRE1Br9dSx+zyt8fs+iQwr5IKV3U4qdCgdkVTBKf5K/
 Yz3jprkzZ4ugklog/v0H/d9xsGxMMtPVq9/xcbe09ov8BL2ZjYN89BlZdtzEf2tyXpk0g3v6luN
 UUmp03j4NJqAD1DOw/9SYlPhKSgEuldSJSD6049Cs5XhCg1FDAgRfun5gn+LwsARvaXcDdPHSIP
 26/NZF3VoqL95mpRDQ8jAI+nk7ucBKqWAY9Zo3dB2Yx0f5A1AqwxYS+gwHyWfpRea7FQg0n0bLj
 3Ao/vxVfjednMk+19pw==
X-Proofpoint-GUID: aQ_YB_tOvCSHEaSWqlNPxDe5sAFxL7_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_130154_457361_5B2877B6 
X-CRM114-Status: GOOD (  10.99  )
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

On 7/9/2026 12:32 PM, Bjorn Andersson wrote:
> 
> On Thu, 02 Jul 2026 17:28:16 +0530, Sumit Garg wrote:
>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>
>> Qcom platforms has the legacy of using non-standard SCM calls
>> splintered over the various kernel drivers. These SCM calls aren't
>> compliant with the standard SMC calling conventions which is a
>> prerequisite to enable migration to the FF-A specifications from Arm.
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/14] firmware: qcom: Add a generic PAS service
>         commit: 08314e7c2c38b9ae6a5e01c58ed10a950859404d
> [02/14] firmware: qcom_scm: Migrate to generic PAS service
>         commit: 5c1a2975d23c51c01aca51945d0f10a4ee4c9020
> [03/14] firmware: qcom: Add a PAS TEE service
>         commit: b6f7978da0c4d26fe465aa6634f5a0b48f900de0
> [14/14] MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
>         commit: 6701259025d49139131a0eb2257659a066dcca22
> 
> This is available as an immutable branch, for other subsystems to pull at:
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260702115835.167602-2-sumit.garg@kernel.org

I've merged this branch into ath/ath-next so it is available for ongoing
ath12k support.

/jeff


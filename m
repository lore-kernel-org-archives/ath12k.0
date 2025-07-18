Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31025C83F17
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5dVwGg7k/V3B5EcnOn+3OotY9camqoCaUdc8gx4guI=; b=RV9MkULpkEDp8lUvhtLr0q73BT
	UxZ1FaFw00dsaRX5TkFLhQH6gTibSIP3O17Kbe95/lh9xiGGFORdYGhKZxXRUbSMbFFcEFz+CHmzD
	dZNjvsqQfa4ljfY+hPFrKcLhWh9MlL7urqslFSa8SPcPd5dv48thNtDQgynh/A6aQvWWmPPn2pRaj
	R7TYQ8mT77wmtIfbMzS65Rkjk+Q5ekaBSlpxw26AWU/H1+UV5RQOYKFjbz5rHuYhk2fifOnh+icIn
	gcvLR6Qp/+zoFVpS2qmdpxdJjT6sLRqWa1sbiBkXncOtAKA5YHC99zqwIVvDSa1qjsl5NSenmu3qb
	dZyJjPRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclhv-0000000ClCu-3tJj;
	Fri, 18 Jul 2025 14:05:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclYe-0000000Cjqx-01Sl
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 13:55:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7ue5R028071
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 13:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5dVwGg7k/V3B5EcnOn+3OotY9camqoCaUdc8gx4guI=; b=I/AMT58uIXI0oiOw
	STO29vzgMdf6dymZtKynzl4+BHPSgLHKqdWA7TVLqRkodv2T80v9H8wwrMa1dpeN
	QwMHre2koZI/rWovRm3eeYkzY437Sd+ZUHsuamLa4AL0f+dR2wcK9HGBk7GZUIJp
	8lPw4nP7h5cMjNU1KvErKsqXap4N2iphrnOVPZYZlYnElcoqPFR+iUAmttFUBGhs
	GmpLcYzRDhMKXhp7l+8pp/5apCyxCfU+LZDgcDQppY5IKlXLn5BFj6uWijIhNzSR
	yq4QQbf35MYWBbpEQemMNnD0Sc6LiZBG5mHqmkAVY1JF9+xYXBaetyOd85ql1hmu
	W3J3Vg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh6407t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 13:55:27 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6159da59a76so105357eaf.2
        for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 06:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752846926; x=1753451726;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5dVwGg7k/V3B5EcnOn+3OotY9camqoCaUdc8gx4guI=;
        b=ZNkuYbf0DgzOmdbJc/md+nJCZ/YvDTsyFJip/Z9NXfALKyfIoBPB1MTP+wkk8ZqWfX
         Z3/4ne1hQHH/D8b/JB9C1HVeiVz1Iba0SK0obx80rbEx6ot9MEMQvEO3lUvdynX9yEr3
         L9Sn9OBMsRr/MhgqRExRbVf8lrYpD06Y3FUToKZzvp0w0VRJAL71DkdCl7qvDQxB5Gi/
         yu7R1xQ8L3oQoTk0uLzfnsgSRdKNmI+kAQ6vvXGl/PGC18SLt/c7rTvIl93F7Z8M2rk4
         1FyYKUxE9xOsW4oc4uXaF+ql2VQigpP4qNVMb8TefJIcnh1VTQTunCNs9xjFVDZq/at5
         U5dA==
X-Gm-Message-State: AOJu0YyuUWlfLvoVQPnAp34Kf9WHC83TBGJwzHAu/P33zUkyp7CE2bec
	pJniorCNWdDcJrFb0uvZsNLZSeL61yCv6yBeHUCQo229+gDFbOK46zdQzHmBNwxrG7dMlA1W3pH
	XOBHjzV2KdbvmeZ3A7o2WCVyL8riPgBGKQWV7yTF9H8L3vs/eUn1kIstTtZktq7VN
X-Gm-Gg: ASbGncuLIMB9CVNPPPYfnD106knvplJD5AXmP+2j8yW9r3z2bhdHwOjKzbFfhUfUE5x
	wFymnr10bzx6zxf+L+LLlQyEbdGSalPtU1y11Z9Qs9NSLvmBfmG4Upj+3Pri08ECDcY01Tk/evH
	mp49NqxH/sOAGyldp6uCOyfGBZwNgVaVF0ve7eRGBRbMBF8NH8jhkaUaa+KbkGs2EuFKzUQil4I
	HANe07aZvOJNPOGZhGh4smrcZb5OasW05XYRsr+R6ILLsqu53Axv9S26qzWZH+/T+naNPRlBpjP
	4EkSblBnDLXojSRWgcPAqisM5GcLyfEiPXOg+lIUVMD0IPeZ/IKX+2dqOMXcXqxAX7nfpUxiHdC
	YA0jflMQwLgDTCpBLpk/YAgYg+wfGYngi
X-Received: by 2002:a05:6870:b906:b0:2ea:6f56:5c1d with SMTP id 586e51a60fabf-2ffb1eb547amr8793142fac.0.1752846925986;
        Fri, 18 Jul 2025 06:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjAMr+J1DWlVlDBeNSf1/DmoGEqOIuzNZhHtUY3MLDIOyJxJXvuIaP+NvfaD3RFPdEhLsjOQ==
X-Received: by 2002:a05:6870:b906:b0:2ea:6f56:5c1d with SMTP id 586e51a60fabf-2ffb1eb547amr8793112fac.0.1752846925176;
        Fri, 18 Jul 2025 06:55:25 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3010179137asm679621fac.8.2025.07.18.06.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 06:55:24 -0700 (PDT)
Message-ID: <429a1fbc-dd2f-4c9b-b8da-73cee76e6732@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 06:55:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/3] wifi: ath12k: Fix TX status reporting to
 mac80211 when offload is enabled
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        Ping-Ke Shih <pkshih@realtek.com>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
 <20250718025513.32982-3-nithyanantham.paramasivam@oss.qualcomm.com>
 <1ae4000edd954cf492e95bdb059c89b2@realtek.com>
 <CAD1Z1JK1wnCTeObYAHALkxDVFm0kx=7r4urtA4S0XorLNOPKfg@mail.gmail.com>
 <7859082aeea642e2a3fa3a2829404b55@realtek.com>
 <CAD1Z1J+M2342-fsyc--MB+K4cd16v-csMKd38Vjm4FSdvatEnQ@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAD1Z1J+M2342-fsyc--MB+K4cd16v-csMKd38Vjm4FSdvatEnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a524f cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=n9Sqmae0AAAA:8 a=EUspDBNiAAAA:8
 a=oF63wo3pCtCFGqcOxokA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: hjVR3THKaDfuTqbMpyL02G9I5Gciqr78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEwNyBTYWx0ZWRfX/17xxye3MwHd
 1dMWuczDayrMIfFI2nZ3ZrrIsqq7vDBdaPS5aHB08euULQqHdrc4NU8p3Z6fFjJbAkTjxgE00jX
 V+J6f9O171j4BAWAolbKdwVxmy5//O0frc+xkjv6CTGwccdiScyM+07RblYCuawoy9li2V5xP19
 iJX2PYN2w/OUs+e6m5QzApatX45fclng4ddtEPQka3/pHpulDDCIz3V2o25nvAvnDM4DPh4bAkq
 +Fo67s6TbyZA4+91bGeISdaJMHF/wOA7SF5yM/eXYQlOzKQtgDdViFebabtbluQedIBzfNp8rmZ
 mM/dB3V2p/xT9NWxN0ZLLQPz7EYRDJBN2eC+qTRK22lo/Z/4ins2u1K71JRiqMjSLBpWe4dXlQM
 QsjftEAr66JTZEQOiiicSCqzaPTmN6s6Yf43rbVcpDO/2KtSJ1R16I4gng/t6sdfDbFpAYp9
X-Proofpoint-ORIG-GUID: hjVR3THKaDfuTqbMpyL02G9I5Gciqr78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=849 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_065528_068353_5BA64EBD 
X-CRM114-Status: GOOD (  15.78  )
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

On 7/18/2025 6:47 AM, Nithyanantham Paramasivam wrote:
> On Fri, Jul 18, 2025 at 7:01 PM Ping-Ke Shih <pkshih@realtek.com> wrote:
>>
>>
>> Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com> wrote:
>>> On Fri, Jul 18, 2025 at 2:45 PM Ping-Ke Shih <pkshih@realtek.com> wrote:
>>>>
>>>>> @@ -578,6 +579,8 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
>>>>>         struct ath12k *ar;
>>>>>         struct sk_buff *msdu = desc_params->skb;
>>>>>         s32 noise_floor;
>>>>> +       struct ieee80211_tx_status status = { 0 };
>>>>
>>>> With '= {}', no matter how the struct changes, you don't need to change the
>>>> code accordingly.
>>>>
>>>
>>> Both ={} and = {0} achieve the same result, right?
>>
>> Yes.
>>
>> However, in some cases, it might cause compiler error. But I forgot the cases,
>> even I can't reproduce the error now. Sorry for the noise.
>>
> No worries at all. If you happen to recall the scenario later, I’d be
> curious to know. For now, since we have been following the same style,
> we'll continue with it.
> 

{} is preferable to { 0 } since the 2nd one causes a compilation failure if
the first member of the struct is not a scalar


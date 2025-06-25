Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B6EC7EE30
	for <ath12k@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqGGFhx6AVCTLXfpWHpti1jyp5AazE3wQBZfo+NlLJg=; b=xNUdfEXH2BDMrOdE9YrfptXlNB
	WjlHwCX+giuOCTfo6BLlEF5It+CWqjhmqeaNCtOqIvAlgxQp54wB8U+C4xnLtL7vQcFq7FJ4G47EE
	f6Bkj9xz9IGXvvP8r3kAQOvbQ+DkIvjufEAD9y3spVs2ivMRouzirlTdFdATQpF9nqbVKbqQlkgOw
	+uyftJ16QJMUERvmOHMMplQeZu7gQfx3EF3jt3+ckY7TarOJjoQaLnrl4x/nLRqCb9L3Xzd34OlE1
	GLI/gmKWax4J0aY88XVL/PxEXfZcB+2NphiPhnovu8+lzOfvHLiZG8FGET0l6t7lSPLSSpfXtzCtw
	wwcy5PPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUs4-00000009ZoT-1rLM;
	Wed, 25 Jun 2025 18:29:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURQp-000000091Oi-12GA
	for ath12k@lists.infradead.org;
	Wed, 25 Jun 2025 14:49:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBVWlw020784
	for <ath12k@lists.infradead.org>; Wed, 25 Jun 2025 14:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqGGFhx6AVCTLXfpWHpti1jyp5AazE3wQBZfo+NlLJg=; b=YDMPZmUSCEGdHORf
	VKxpYOmQXtgilnrbYwx3ONk1guyObWr6p5Z2iWrVitTkdtaHr2elr2sP97BlTOWB
	Av4816s0UV4DXyLJMKu6fzlZQoqSFWQwpmHYc998VHerijgYr1H+/zCJrR2WQgSK
	qGzDSjXY5BJzv0uaqxoaPKVrNbZ8LvLU1ZO3qHTIdFP3qXaSFmRdnniaLjFpcgOy
	UXSEW6CNNwC/p1DomXr1IRzyEIAJmjLrOdWz3PLMmbb1u32VrGhTdXco9w9ULIop
	OJg6DZc65BuA0trhL8fK2hjgF2yxhB/wjF4CcbyGFBjo78BvyzigiYFCAewrGGXM
	BMaNkQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b403r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Jun 2025 14:48:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f30d56d1so728990b3a.3
        for <ath12k@lists.infradead.org>; Wed, 25 Jun 2025 07:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862937; x=1751467737;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqGGFhx6AVCTLXfpWHpti1jyp5AazE3wQBZfo+NlLJg=;
        b=jQ6LDFhZh4NAAzeH0l453fYXytPsgK5DyWnCVyXRcOpEHun2U70Q4Z5B0mcPOJk50q
         GrJtZuFevkDZfowtrJBZFdx8x6sci4g0pgli363ZMz6cVgqhNnD5OhjA/lru0iQ5eSZi
         IlcxYG5b9QSWG4i/HGfMl6QZAXEDwfQr7rAbYw2pIVjcQXfgo5BXR+RnPF9T1oad8E3+
         6s7nKGx5aMO4+ChQ8nL6JCRM/TCXQZW/oXSSyIhp/0oYRbDBNJRfFaUjeYft9hWKMSDZ
         ItICrML21gi+59nwiaq+0IRgDL1E84vr8BMt70lDVAYau15bkn7bvMN06mZ+XBPFwyub
         p7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsydkThcFjjVZg8MV3yylROtpG28G8bX1lOpRJKFAm9sghXZ9GC6/qMZK3P0QDf+QBow3lZo4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQZkVwAr8ItGeV3lRU0ADjuc+KGHst6E6vsgtGmYOYKGp7mJTG
	t/+ndslKot1rg4RTjox0+hfoqXkRSwP0pxIbhOI4osZvO467DnjZzUkd4BgaCntOjbudvIRt3EN
	hQlWvDFXfI4FLrkCbSHvZ4sdosI5Hsat2H5AWCqkZVdebFKgkC3J0wyNoevxn9dmi
X-Gm-Gg: ASbGncsujpIzwmuVPBbf6Yuct5DjHlIpXIxS2JQYUwZ7/GPyJYmP064eoL2fr03my8o
	FsPzZYH2xf4quyehMOtebNhZfFN7fZXLlfAwCqUMk3sH4JWlI5LzfTMdvUbChK2d1PthwtC3KTw
	gUwJiBpDRSgvk9tkAakEmPvXYYXxxk2ucgQVenX/h2O82K03j2zRzTMAZmwi7mMy6YUbyoSU+xC
	/X5IE3zLKyaNQ90GraII6oOLk3+NrGbhp73RAjYVZ6MIP/g7vuLJxLN9h3adADWM2igyhMgwngO
	Bu0K+YVongHN07zY3yEN58Rn/hgub5MvlyrODGmulgj+AwFqnH/PHJXwQpPf/2E2KDByuOELKtf
	lTQ==
X-Received: by 2002:a05:6a21:38a:b0:21a:de8e:44b1 with SMTP id adf61e73a8af0-2208c610eeemr176605637.34.1750862937314;
        Wed, 25 Jun 2025 07:48:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+XHscp/yEzgIUgr5HvkN796Je8M5rUAoryyGJvsCBmHFT8xX3ENlpIX1qc5J+I50JLhQlLw==
X-Received: by 2002:a05:6a21:38a:b0:21a:de8e:44b1 with SMTP id adf61e73a8af0-2208c610eeemr176572637.34.1750862936922;
        Wed, 25 Jun 2025 07:48:56 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f124249bsm11161411a12.38.2025.06.25.07.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:48:56 -0700 (PDT)
Message-ID: <e23d7674-31cd-4499-9711-6e5695b149c6@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 07:48:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
To: stable@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gregoire <gregoire.s93@live.fr>, Sebastian Reichel <sre@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Johan Hovold <johan@kernel.org>
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
 <aFvGnJwMTqDbYsHF@hovoldconsulting.com>
 <2d688040-e547-4e18-905e-ea31ea9d627b@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2d688040-e547-4e18-905e-ea31ea9d627b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNyBTYWx0ZWRfX6worz8PTkKVL
 XIxMhOpj1Fdp8X7Js6acP0xRfDDnUhkYHqoTJzMV2wiKTgpfZthRdrjofvlcU9LcJvUYOVT/VOc
 u486+Wmd5xl6innvm3Z7lAldjMuGg/FdCUBW9H7DoCG2HMh2Fnpwk/r+Mo/Z1g+NFLWT0d9B3qS
 Wdu/j4HSyyp4ORpqxErDYYK6odMEUNR67ca2mA8PyDgllPprJN5XYTK1eMTO0TWoWncCeZewUhB
 ARGYZ5IPZKPv4dgjZALucGwhu6etj34tM8MZ9zYduEqQkUr1QmwneQMQekS74NJmQFsMvSUZrLA
 dnVyFoPMvmba/WQzmPfEJ64pptWPfCoXqEM7rgiyz9MicTYQ1zbkoMV+AT6efLIZ2kpJGyPXWW1
 GWrYbTbh0QnM4UszGdQJvLQD8kxl88OJRw+tPVu8EAVmlpXu4sm7vx3obJSpmAgKLIDaYF8d
X-Proofpoint-ORIG-GUID: qGvC2VMteAHPEGhU38MfQHYEbh6WgZLt
X-Proofpoint-GUID: qGvC2VMteAHPEGhU38MfQHYEbh6WgZLt
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c0c5a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=bC-a23v3AAAA:8 a=COk6AnOGAAAA:8 a=dh4-YsZgxDmbEjmCT7kA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_074859_295418_3180C112 
X-CRM114-Status: GOOD (  16.46  )
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

On 6/25/2025 3:15 AM, Baochen Qiang wrote:
> 
> 
> On 6/25/2025 5:51 PM, Johan Hovold wrote:
>> [ +CC: Gregoire ]
>>
>> On Fri, May 23, 2025 at 11:49:00AM +0800, Baochen Qiang wrote:
>>> We got report that WCN7850 is not working with IWD [1][2]. Debug
>>> shows the reason is that IWD installs group key before pairwise
>>> key, which goes against WCN7850's firmware.
>>>
>>> Reorder key install to workaround this.
>>>
>>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=218733
>>> [2] https://lore.kernel.org/all/AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
>>>
>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>>> ---
>>> ---
>>> Baochen Qiang (2):
>>>       wifi: ath12k: avoid bit operation on key flags
>>>       wifi: ath12k: install pairwise key first
>>
>> Thanks for fixing this, Baochen.
>>
>> I noticed the patches weren't clearly marked as fixes. Do you think we
>> should ask the stable team to backport these once they are in mainline
>> (e.g. after 6.17-rc1 is out)? Or do you think they are too intrusive and
>> risky to backport or similar?
> 
> Yeah, I think they should be backported.
> 
>>
>> [ Also please try to remember to CC any (public) reporters. I only found
>>   out today that this had been addressed in linux-next. ]
> 
> Thanks, will keep in mind.

+Stable team,
Per the above discussion please backport the series:
https://msgid.link/20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com

This is a 0-day issue so ideally this should be backported from 6.6+

/jeff


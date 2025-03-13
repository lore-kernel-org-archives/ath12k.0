Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8B1C35FF1
	for <ath12k@archiver.kernel.org>; Thu, 13 Mar 2025 22:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlscsM8kt3jhJKPPI6WK1DrD4tGRZlDapuFyYmG6mcg=; b=fhGMUholL/1hsLPzCmgPfkmeKp
	DDqL7SamutZ+EDxNHwR9HFlp+tXrTW6a4NmXgB6oj32PIjCtnvjz+cKYZmCrVlrZN8fz7FC+2hSiA
	YaKvd2plf0Cnn2SCkbVwsVPcURM3Rxl84t5fD8llXmP7JAGF/ISKShFqM/kXeuJIGr1n/C6bGNyiY
	NvuW6PLLHWsEQXYPkUPp2wUbDBjkMLTItVtEJqQ2YQ16RXAeUTeErjBpSEeawpnqWTrsnGDmK7CaC
	MicB9MIk/1eoCVvlBKocfVijJllvlYSVC+lDnglC5JB5VIqo67DDPCURgnkjRkNMZlkUPLWhlcQpX
	kPGKm77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrWQ-0000000CfSw-0Jd3
	for ath12k@archiver.kernel.org;
	Thu, 13 Mar 2025 22:59:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrWM-0000000CfRe-1uV4
	for ath12k@lists.infradead.org;
	Thu, 13 Mar 2025 22:59:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DCH58Y007315
	for <ath12k@lists.infradead.org>; Thu, 13 Mar 2025 22:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DlscsM8kt3jhJKPPI6WK1DrD4tGRZlDapuFyYmG6mcg=; b=b8CMSaYBktavQErc
	gzusZSPvMwScqKoW3tctXMTYLyd4gcn2OOieGcI6SL/mRyT4xG0+Slv54X9a10/b
	/N8QcUdtGMV9bnNoc8pSRuXMP6enZu4Be9umNz3O4+xit/f5KIff4kRw+HWSe0Fh
	TBalFKphubh2sVN72QtDCdJ/7cKOWqd64OSdazkE35xxo9adt5J5BdlTL7K+Uoau
	Ow8regM880z1csbIkMIaKIAdKhQaTTR/XDChREwF2P1mZjNF06ncWPFD3ZHV7UOG
	aQ4m2bRbKj3OOnWIK8LQiH4/IBvVc6h1ZB3peYTO6UvIglweINVPtJJsawIptu+t
	h/Lg/Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg8b49j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 13 Mar 2025 22:59:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-224347aef79so13538095ad.2
        for <ath12k@lists.infradead.org>; Thu, 13 Mar 2025 15:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741906759; x=1742511559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlscsM8kt3jhJKPPI6WK1DrD4tGRZlDapuFyYmG6mcg=;
        b=AUwREu9Yev/SxgEmHXeXYC9C6nn5E9iYakcogtDfk4TfnVZAPg+qpwCHM0UaZWrEFk
         Ma7htQw+IaUJFcizthoqZsejmhjVvy/5ChTSgL8Y/DQwnSRixj15kHKG/+y+vL6ufwnD
         jlCsbmuyA4BG38her/KYGLp38utrJQoi51J0ayI61vJY0pQhlae+JEMjtdyNi3Gqro4i
         K8a7QdQZfbczKxIZQOf/hbfV8zER1CW1r51xbzHPJucOpmEXAuCfNt7yP05Z7LJclPVs
         3ec77gqGWbQj5ag6KjlhUDmnHVWNQI8q1GLJj4IcF5/NgmY+JzbdFjtLszrGWW8gDDNW
         mfuw==
X-Forwarded-Encrypted: i=1; AJvYcCV+17gCkqDiUd0kK2fHsIruuBw4hA5aiHX426mbIpbq5hX1A41WLqdbyCYUHn8MHyFfI1FWkXw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2DljawOqtVgrqu6QPeG3XwfWz6Yiw7VuZ1Y/06YyxXzdV/1Nx
	GXp39srwtENJSpebnnfbrZ9ghd+41idTqBepf3suAkQ7s7E2F7nkf6wW/PRDkVTkWvlR2DK1Ih6
	fZkgH3sQrc1CKJZGKwEkVo6isOdzpagyfzG89ULbgEf2aoq6YyB/y7QgblH7r
X-Gm-Gg: ASbGnct+JDCMF48O+QpSodlQ8wDdC7FIKS299guF2Uj+w7UP63IPM0Y0OytLhFiLqm9
	S8yK6OJhEtz7qsSL45ZPk+7S4CP5Cfm2O/e2fCAnrOJcAo+7D+kEFCoK2ZMAjvwF/sXE9Sk+/4x
	qcdLBIum2jwrtWYMUKkClfVr1Df4dK7+StMmiUQTNyoFeMfKQAH1c1DdP5NohLPLe69a3N5DEPH
	b9q7/zBIw8jTlACtAVaW9g8TNiPkZEfBw/5F7BUoIQlU7BcN3YUaXwcKGLnfq4r6Dqxpcs/Gctk
	CdxiVbkCZPNIitjbpqUduZ3HTpVSIyWSwdd+nl6S1+9+cPA9B0WJ7waKdOl3WcXNZwjRAxX/
X-Received: by 2002:a05:6a00:a27:b0:736:4644:86ee with SMTP id d2e1a72fcca58-7372235af19mr315816b3a.14.1741906759452;
        Thu, 13 Mar 2025 15:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy3xVoqb3anhbGk6RmIqiQdZbFPhRI7ciTb9mdlxU62/8hh2eKyhDOtWNxtwvEg4Z7wcZKAA==
X-Received: by 2002:a05:6a00:a27:b0:736:4644:86ee with SMTP id d2e1a72fcca58-7372235af19mr315798b3a.14.1741906759009;
        Thu, 13 Mar 2025 15:59:19 -0700 (PDT)
Received: from [10.227.89.219] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371155077fsm1897725b3a.37.2025.03.13.15.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 15:59:18 -0700 (PDT)
Message-ID: <4e4e4737-6040-4ec2-a3be-3fe1aba7b7cf@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 15:59:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] wifi: nl80211: add link id of transmitted profile
 for MLO MBSSID
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>
References: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
 <20250310200237.652950-2-aloka.dixit@oss.qualcomm.com>
 <52beaa2c05c91590797cc1f53b779fca085c8850.camel@sipsolutions.net>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <52beaa2c05c91590797cc1f53b779fca085c8850.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d36348 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=0-u4nmc4IinrO2lHwEAA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: c2Pfx8NhV8KL1kgIG1vo8fR4U0EUbQjl
X-Proofpoint-ORIG-GUID: c2Pfx8NhV8KL1kgIG1vo8fR4U0EUbQjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_10,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_155922_515838_435FBA22 
X-CRM114-Status: GOOD (  20.78  )
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

On 3/12/2025 1:55 AM, Johannes Berg wrote:
> Hi Aloka, all,
> 
>> + * @NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID: Link ID of the transmitted profile.
>> + *	This parameter is mandatory if the transmitted profile is part of an MLD
>> + *	and the interface getting configured is a non-transmitted profile. For all
>> + *	other cases it will be ignored.
> 
> So I guess it's a question of what "the interface getting configured"
> means, but I guess you could set up the transmitting interface?
> 
Right, if the interface getting configured is the transmitted profile 
the link_id is ignored.

>> @@ -5561,6 +5563,18 @@ static int nl80211_parse_mbssid_config(struct wiphy *wiphy,
>>   			}
>>   
>>   			config->tx_wdev = tx_netdev->ieee80211_ptr;
>> +
>> +			if (config->tx_wdev->valid_links) {
>> +				if (!tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID])
>> +					return -ENOLINK;
>> +
>> +				config->tx_link_id =
>> +					nla_get_u8(tb[NL80211_MBSSID_CONFIG_ATTR_TX_LINK_ID]);
>> +
>> +				if (!(config->tx_wdev->valid_links &
>> +				      BIT(config->tx_link_id)))
>> +					return -ENOLINK;
>> +			}
>>   		} else {
>>   			config->tx_wdev = dev->ieee80211_ptr;
>>   		}
> 
> So shouldn't that be one layer out, so the link ID can also apply if no
> interface index was given, i.e. we took the else branch? Seems like that
> should be applicable, or is there a specific reason not to apply in that
> case?

The 'else' case in the highlighted snippet above is the same scenario as 
the 'else' case you referred to, which is one layer out: "else if 
(!config->index) {".

Both are executed when the interface getting configured is the 
transmitting interface. The difference between these two 'else's is that 
in one case userspace explicitly provides 
"NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX" and in other it hasn't.

Similarly, for MLO, mac80211 does not need the link_id of the tx 
interface because it already has the link_conf for it as part of basic 
AP configuration parameters, hence link_id is ignored in both 'else's.

Thanks.


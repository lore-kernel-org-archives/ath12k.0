Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F25AC54E60
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JR5QujvucPNtP7rGD/ADHSVsAGRQcE7JIMLJA8xdfSQ=; b=nTOrDzlpKke4M4B8xks1QaCNEG
	dSCiuI0D2sgMBFkm6azA5f/OGpCcCUBG2aIE7FWOzySnwXvmxOCeMM0eWe1CpW7NHmWrUEv6Idc3Z
	CbaAJiqwHPzKqUdHBCiU8QhfIkU53xE9LkUeRq5BiLMq7Z+YrG/46AVl+Igg6VesL9e50bJt0msAz
	AuiLwNz8OUHgmW5LXJiKA4Ci5qV+kzoZv43vTAPvh4Ty91NsclKMSaaDybpDcc6hqmQXbdaDOzlVw
	A3FXN5/cR0MpldgqAxAIMgnW4IqIZOkTp2ZcV351Jk+/HBHc0A3Ofx188UGmrZJ6KDJ8nWEcUQh9v
	wCYv9NqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rko24-0000000F1Bu-2fVz
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 16:34:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rko21-0000000F1AZ-29wq
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 16:34:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42ECrQdJ014862;
	Thu, 14 Mar 2024 16:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=JR5QujvucPNtP7rGD/ADHSVsAGRQcE7JIMLJA8xdfSQ=; b=GS
	LGPIwFBek48Me5mxt2XCEmNs8Cep03TqaI9SisV2NaS1VWoxI9GHUAYWdEMjoco8
	fT4eVXUHM3gSyGWEl4LfwwNrcEAPLyuYHaa1etRiOiaG3QB+s7SdY6yfFHHRK9eo
	YFEVx6j03DOb+e1SpdqXF9CRvAEchAu/nZOXdtLp0WTraJCxu3LNaQa9UjyvRhyx
	TS7QvdB2lrknktSPIzs9R9lh8WZN2PgWfjofhOOV/7Czyc940gPiqqovp8t7iHUf
	5/Ukiz/txNbq69bxYu5pwJ3n4VVWPhVf0OgvCkurBw9puejkwAJefM9zcl0uRP+W
	mcCNmJK7A1clScqRuejw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuujssdyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 16:34:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42EGY6iF031340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 16:34:06 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 09:34:05 -0700
Message-ID: <3883eb2c-54dc-4492-bbc1-9fea02e7e46e@quicinc.com>
Date: Thu, 14 Mar 2024 09:34:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: iwlwifi: mvm: disable MLO for the time being
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>,
        Miri Korenblit
	<miriam.rachel.korenblit@intel.com>,
        <ath12k@lists.infradead.org>
References: <20240314110951.b50f1dc4ec21.I656ddd8178eedb49dc5c6c0e70f8ce5807afb54f@changeid>
 <20240314110951.d6ad146df98d.I47127e4fdbdef89e4ccf7483641570ee7871d4e6@changeid>
 <87bk7g4x08.fsf@kernel.org>
 <09ca997159333980a168051a2a49c675a8ad5eeb.camel@sipsolutions.net>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <09ca997159333980a168051a2a49c675a8ad5eeb.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KyTGkh9WF4iAciQhO2XfFnJ-mE1k-EdI
X-Proofpoint-GUID: KyTGkh9WF4iAciQhO2XfFnJ-mE1k-EdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 mlxlogscore=560 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_093413_720265_6E6CB020 
X-CRM114-Status: GOOD (  11.78  )
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

On 3/14/2024 9:09 AM, Johannes Berg wrote:
> On Thu, 2024-03-14 at 18:08 +0200, Kalle Valo wrote:
>>
>>> -		hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
>>> +		hw->wiphy->flags |= WIPHY_FLAG_DISABLE_WEXT;
>>
>> I think we should add the same for ath12k, right?
>>
> 
> It's really up to you, I think. I'm hoping to even get this into stable,
> FWIW.
> 
> The biggest issue here was our firmware, but the stack is also missing
> some things, e.g. we see CQM problems (warnings?) if you actually use
> multi-link "in the real world".

what does it mean "disable wext" if we are a mac80211 driver that doesn't
utilize wext?



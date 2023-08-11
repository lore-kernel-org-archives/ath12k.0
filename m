Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FB8C0015E
	for <ath12k@archiver.kernel.org>; Fri, 11 Aug 2023 09:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1uSEfo67kb6rlGT1JaHxWu6YtswM4lHgew4y7XSFG4c=; b=h5M8H4v2AsgulD
	eaqZSf7a4MaAtMBCJ6kHmXwsa6WfopjIoAI8FNMKQ6Lf1qeOiTy6ZxcODlBsOGeClzrnbbXW7fPSq
	/7N73NYRnkBRjbBzGTrOzDHXDD/jjPB802P3F+mojGMvWDaYbmZe/SSxRtzMxhHCHs8pqrbEzWXAM
	XBsNjh3LVo76+lYLeCu+zNoq7Zaflno4qJaRdRTaGt+Cp4XccF3Oyv6Ox9NfFTGBdrez5aMtEkm7t
	5ni8uq7IyUS6RgUVMsvgswe8a921HtL4D1pejJdhRdvndOkPIUPe4bjhWBKqx8b612+w4m2QBWdK9
	MFIp6lxXjK/VMmaf+FjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUO5G-009vGP-0e
	for ath12k@archiver.kernel.org;
	Fri, 11 Aug 2023 09:05:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUO5D-009vEB-0s
	for ath12k@lists.infradead.org;
	Fri, 11 Aug 2023 09:05:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37B5nh1D003965;
	Fri, 11 Aug 2023 09:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HAM0a6ZcEdfIQ+/jAQH8K4x73Bm8DVo1K9GQ29uGrB4=;
 b=LhqU6nWwuBGpB89GY8BROXqBmyqPAl11kmKaqQ9HkAl/RQsp4bOlsh5k3WQMawEU8N3U
 SJgBOfog8clg2r0IImFw4q8gCpaeU3O3sQzMpDbIrn6HTICIoNB48kUSNaCLRVWutKm/
 9rlJ5M5QLmmXN6ADF7/o6uZKlTxcwcCv34bAaX6z2o3hQIQFhSb969bDOu0eTEnw3cgl
 KGeR+AH2vHj/JpeGpYfOPS/3EDv97dQWWxOMqqzCn6nIja9poswtOqMeuWkTJokX5o/D
 2fMJ3bQHCQfgcwJyJNPUlMb4ilbC1WopwxMXl2fdEeZecS1dXqCwHUJEdU9wIjWfKPRB dw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sd8yb974k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 09:05:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37B95Jlv027918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 09:05:20 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 11 Aug
 2023 02:05:18 -0700
Message-ID: <cc6b83eb-ac30-34fc-4827-290a9ae25378@quicinc.com>
Date: Fri, 11 Aug 2023 17:05:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 61/76] wifi: nl80211: add EML/MLD capabilities to
 per-iftype capabilities
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>, <quic_rkaliapp@quicinc.com>
References: <20220713094502.163926-1-johannes@sipsolutions.net>
 <20220713114426.4dfc9ebd0461.Ice7b841051cfeb23da17bb2caa0e45191b34c4db@changeid>
 <d2f17799-6d90-9d72-a389-565163d723d2@quicinc.com>
 <f577425e2d4fd6141c29bcbfbea919565da9326d.camel@sipsolutions.net>
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <f577425e2d4fd6141c29bcbfbea919565da9326d.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 201CXb8VyLz4Lc9t7ncOAn4mZGI3gPsY
X-Proofpoint-GUID: 201CXb8VyLz4Lc9t7ncOAn4mZGI3gPsY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_20,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=347 adultscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308110082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_020523_330669_4EA26C91 
X-CRM114-Status: GOOD (  13.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/11/2023 5:03 PM, Johannes Berg wrote:
> On Fri, 2023-08-11 at 11:51 +0800, Wen Gong wrote:
>> Now there are many nl80211_band such as NL80211_BAND_2GHZ/
>> NL80211_BAND_5GHZ/NL80211_BAND_6GHZ... In the same interface, if some bands
>> support EML, and other bands not support EML, then how to handler this
>> case?
> But ... these are MLD capabilities, not of the (associated) STA?
Yes, I know it.
>
> So not sure how that would make sense? What would you even _do_ with
> that?
I think another change is not move "u16 eml_capabilities", and only add 
a new
field "u16 eml_supp_bands" together with the "u16 eml_capabilities", the
eml_supp_bands is filled with the bit map of enum nl80211_band. Is that OK?
>
> johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

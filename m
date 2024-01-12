Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5420C4707C
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 18:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmvOwQJ06nTGwJNN6waze+Gy6Rx9VCSweWzKuRUPnr8=; b=QAeq5Cc5DxUNlfYqY4CXibluMH
	FSc6YjzPUTHrQQEUwQE2+oEBbY6hVAy2SRbq3EeX0oVHhhvaWgHZz1rZug2ceefTD6HdHuY5UN4Uz
	pZn3Sq8jIXRkefaFPjSOX1nG2DMsQvr1Vb7HnmH1B581oNamyT5ZqbWpbiwH/vKawNMbJuDp44+sh
	SSlCyO647OfL4tqFSGFEEkOYWDrzou9yTrc5ABD9OI7XvHZhK+NbWCTCaqa4OFuWwPqoAhVkujl0g
	VujFmEPM+43sD0fGNcM/9/4SkVtdlefabSZaKP2bnaQYgwLnRFSohDFu23J+NZgmukYgr4yATAnsJ
	TIpG5C1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMIE-003btr-17
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 18:30:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMIC-003btW-0F
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 18:30:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CFBFWP005408;
	Fri, 12 Jan 2024 18:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=OmvOwQJ06nTGwJNN6waze+Gy6Rx9VCSweWzKuRUPnr8=; b=pc
	GZYS+C3+Z79Bx/r+O7TPj+NZx8pY8ndPtfpX5UKolJ+pHVm5vIirzvWa9UIchq2w
	e4inh8Dg7li9wVyKwr1R86atZcVU2GLZekiB4mZAXwxBkUVRmQpn+e4V9px15MM0
	iSBl19Kv1iuy9p/FWmHl7Qw33AjsSfIG+yuhuW0iJeYD9RIlrhnzQJ938FFWzP6m
	tuAnBGMEvxKXGq2oqtIt0H7M3E/ss/nilO4KLMu5mJIah0qtPcx1mYHTEtrSWZHH
	SXVjTttBHc8JnwS7x48tO+ZA/UrPzfr59cggs1OKmcKMgQ3QZNs5GgzAsyBLJND5
	g77Rn/rfTTcyi56hNT3w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjpuj2tx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 18:30:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40CIU68O022496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 18:30:06 GMT
Received: from [10.110.16.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 10:30:06 -0800
Message-ID: <2477a521-a73a-42be-82c1-71fba452791f@quicinc.com>
Date: Fri, 12 Jan 2024 10:30:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] wifi: ath12k: Add single wiphy support
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: "Sriram R (QUIC)" <quic_srirrama@quicinc.com>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
 <f1431217-447e-4d1e-a97c-e5cea6ff2c36@quicinc.com>
 <606709d9eab84207b0ab73d12e7defcd@quicinc.com>
 <138fbc0d-4bb9-4a04-986d-c98facb43c9f@quicinc.com>
In-Reply-To: <138fbc0d-4bb9-4a04-986d-c98facb43c9f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LyQEtZj9LbinlrnjopO0N9EttjlUnJzN
X-Proofpoint-ORIG-GUID: LyQEtZj9LbinlrnjopO0N9EttjlUnJzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=815 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_103008_140214_CA047F0B 
X-CRM114-Status: GOOD (  13.11  )
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

On 1/12/2024 8:44 AM, Jeff Johnson wrote:
> On 1/11/2024 8:34 PM, Sriram R (QUIC) wrote:
>>> -----Original Message-----
>>> From: Jeff Johnson (QUIC) <quic_jjohnson@quicinc.com>
>>> Sent: Friday, January 12, 2024 1:46 AM
>>> To: Sriram R (QUIC) <quic_srirrama@quicinc.com>; ath12k@lists.infradead.org
>>> Cc: linux-wireless@vger.kernel.org
>>> Subject: Re: [PATCH 00/12] wifi: ath12k: Add single wiphy support
>>>
>>> On 1/10/2024 8:50 PM, Sriram R wrote:
>>>> This patchset is dependent on "[PATCH 0/2] wifi: ath12k: Introduce hw
>>> abstraction"
>>>
>>> I'm currently unable to apply the prerequisite patches to my workspace, so I won't
>>> be able to review your patches until that is resolved.
>> Sure. I believe its resolved with "[PATCH v2 0/2] wifi: ath12k: Introduce hw abstraction".
> 
> Yes, I have now processed the prerequisite patchset, and your patchset
> applies cleanly on top of that.
> 
> As already mentioned you need to add your S-O-B to all patches that you
> are posting on behalf of others. But let me review the individual
> patches to make sure I don't have any other comments before you re-spin.

OK, I've reviewed the series. You are now free to incorporate the
requested changes and to post a v2. Please include my Acked-by: Jeff
Johnson <quic_jjohnson@quicinc.com> on all of the patches where I have
already supplied it on the mailing list.

/jeff






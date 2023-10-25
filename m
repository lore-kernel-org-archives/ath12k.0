Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CBFC07545
	for <ath12k@archiver.kernel.org>; Wed, 25 Oct 2023 15:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vTYREun4ZGfyI31uRuuNebFZs949QAFAw05SYl1ekwc=; b=OujcD2sktdhOCq
	ETfPTN/bHLeM+sqJet3FSJk2sALxEk1mOQ8YIhhQ2gqqa4lCeDQkPhDarE8A5HYIG38jRIoNm/2I6
	pPP5gKElzvJD3JO4YXEpLN9EyMKRr9FmsStEKYDdXy2ip5JcL9asTJiglSduxJu3ZAjt0gKyh+N0x
	tbh7g+QljnmUZh0+YTG5t/rqakSdpzseKwHeimbn1Hdnogy+i54/eRyh90TrbLBAxvcs2Jj02Jd9V
	XrWmsI0JWzFNGrt45OrbIt7K/76SnBD0M08gI4p1H/OaSX9+HYWQQBOZ/RmooMxdfj6Wh018mKLLi
	7VgYDOrh/vBaoaR4EDMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvgG7-00CfHx-1t
	for ath12k@archiver.kernel.org;
	Wed, 25 Oct 2023 15:57:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvgG5-00CfHd-27
	for ath12k@lists.infradead.org;
	Wed, 25 Oct 2023 15:57:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39PDQ4Eq028981;
	Wed, 25 Oct 2023 15:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SQTscEEGyLS4/y/ePQ3HTxjVVgwjTkKWys2p8oXosRA=;
 b=j7jAI1D+POji1NlkXWpMoiTTYwyzomP/r8Jzpz+PJFn4tUWjLtDxQlcoyp8O//GlC0fw
 N+nghzSkj6nmr0K9Sj+O2sguyDmw1leDxBjspSAaf0SL09JTU/X4J0W2S0ci06SqkhFI
 DquCUF5AunkzQ/mIz4Oqyyww7j9x2HoYm6pAG7m3UTIvPhLkNVu6r62X6akyIIR8iDq9
 ZZ8RzSoQhiJ7CrFxl8XprC3J75FLtFmyUsTx2lxl5RTL/zZi2+A5YEnw8pb1xyjh7aZ9
 nXWObRK/NDmUzfikgT9rYZ2UQ+t9ZMxMij+ZQpcSSHG304Ofp83noFRdGWDKt2oYOVv+ gA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3txngvhxw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 15:57:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39PFvAQt014013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 15:57:10 GMT
Received: from [10.48.243.236] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 25 Oct
 2023 08:57:09 -0700
Message-ID: <77205594-e8eb-4303-a2f6-d64ea80c2fd5@quicinc.com>
Date: Wed, 25 Oct 2023 08:57:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: drop NULL pointer check in
 ath12k_update_per_peer_tx_stats()
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Ma Ke <make_ruc2021@163.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20231013074711.2202850-1-make_ruc2021@163.com>
 <169822778398.891844.2822098383458779586.kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <169822778398.891844.2822098383458779586.kvalo@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6wD8ysc4m1ahQADIL7-j5AFmz-DdXw9H
X-Proofpoint-ORIG-GUID: 6wD8ysc4m1ahQADIL7-j5AFmz-DdXw9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_05,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 clxscore=1011 adultscore=0 spamscore=0
 bulkscore=0 mlxlogscore=936 impostorscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310250138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_085725_835412_DF9A44F1 
X-CRM114-Status: GOOD (  11.11  )
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

On 10/25/2023 2:56 AM, Kalle Valo wrote:
> Ma Ke <make_ruc2021@163.com> wrote:
> 
>> Since 'user_stats' is a fixed-size array of 'struct htt_ppdu_user_stats'
>> in 'struct htt_ppdu_stats', any of its member can't be NULL and so
>> relevant check may be dropped.
>>
>> Signed-off-by: Ma Ke <make_ruc2021@163.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Jeff, what do you think?
> 
look correct,
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

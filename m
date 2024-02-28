Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3EEC5478C
	for <ath12k@archiver.kernel.org>; Wed, 28 Feb 2024 17:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqTd1VEdR103+ulrecG5rCEczPcPrLDxiW+ADUOgIUM=; b=JdVTU1fkK+ttl/gktQ86VtCIiF
	UeB0xdpx8uu+W3kkjGBTn5u6Hu19quj6njviE3VwtMJh9DC7rFePwYee+1vKBDOpmsgyqtiYZIMPy
	EFrmW4thjAzdYZ5RUOYjiZw12KcTvgntyElCNEIxHlAPpbr3xt1q4+53cc9An8vMfZ83YRVY6MaLB
	93iwpL3n024b5UI7fokRXBeIfu53tScA95PnnRF0vQYq/YrFfwzr1xV3Lq6XbGMGMwOSMe9KIJzFu
	BearDPmksWAANKU4sIh1gj/eehxBuyjlnfyqam9SiGZHgguFv24tHPuZHC0pFraoUhTKlUb68kce6
	6/7pD3Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfNtu-0000000AKN8-2hhJ
	for ath12k@archiver.kernel.org;
	Wed, 28 Feb 2024 17:39:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfNtr-0000000AKLX-17Um
	for ath12k@lists.infradead.org;
	Wed, 28 Feb 2024 17:39:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S47fbG008761;
	Wed, 28 Feb 2024 17:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sqTd1VEdR103+ulrecG5rCEczPcPrLDxiW+ADUOgIUM=; b=dO
	BISsyMls2omhKLkudJEEQ5d11+kcx6y/RBce7O7Yw7Uebgwk+oufEq2voEoVKCbk
	auRu+u85IaDCInh4Y/u1halHlNZ4u43SICv68uDrcHnLOw4vq4M8iLeCgfsuUKz1
	FQqBofzFvnjSae1Z9i/YA4MVtlryAQl7vX6EqQjhqdI/FzXk3xa0YVAFmADlngR1
	JmBxRPn+YN6ke7EVQEaXKK5nMgkHflnOCbRTXOphXDi2nFIXFZJfHAtBjiHe8d9z
	gn0ENsLB4EA1WhxoWIfRxMyLc80xVhRP3WF9F2PgxUesgYRCBpesSi2koJaa4bqR
	EnVdIBT6rWta+/TsVOsA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whv1ft1a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 17:39:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41SHdIc6015120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 17:39:18 GMT
Received: from [10.110.113.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 28 Feb
 2024 09:39:18 -0800
Message-ID: <c0997912-3fae-4401-91f1-ea67e43993fa@quicinc.com>
Date: Wed, 28 Feb 2024 09:39:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Performance of WCN7850
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>
CC: <kvalo@kernel.org>, <quic_periyasa@quicinc.com>,
        <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
 <6a5b62d3-d807-4fa0-91e8-fde93d114b36@quicinc.com>
 <CABymUCNYBMxzQ_BUObU+mKaDVo0uYpH8pkVn9=Rry6L+FA6TRA@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CABymUCNYBMxzQ_BUObU+mKaDVo0uYpH8pkVn9=Rry6L+FA6TRA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -TE8redN2tV5H9PTlDY8i8jb_2TfEJfe
X-Proofpoint-ORIG-GUID: -TE8redN2tV5H9PTlDY8i8jb_2TfEJfe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=748 impostorscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_093923_459714_7A50FD90 
X-CRM114-Status: UNSURE (   4.90  )
X-CRM114-Notice: Please train this message.
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

On 2/28/2024 12:52 AM, Jun Nie wrote:
> I suppose performance of 5GHz can be aligned with 6GHz, even they are worse
> than custom datapath in Android. Is this the right expectation?

That is my expectation. I've made the development team aware of the
discrepancy you are seeing.

/jeff



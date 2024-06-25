Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D7DC2BBCA
	for <ath12k@archiver.kernel.org>; Tue, 25 Jun 2024 17:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsckhxO2eyvlVTzi/1TuZcLt9XqppgZI6qdch4c+MsY=; b=eAE7V+e7znMaemFkjD9sDGH3Yu
	vL1G3jqxAtaV0jO/xieji9vC8IwYGe1K0rs9fwWBO3l24Su3D30c6ef9UaRViFhaMtnqcVXa0XK8+
	2evPtpQSnJcHcZuItyUF42W2TWLeArKXB0NS6dSwJJfzlm+1vUqoCgfrR2qtf4o5zSfxQ2gAo2g6f
	adqXFGq/N4GSI7H4DkrPX0OfeAEChuHNQJlGAhnZ9pJy2CE6GoqnrwToaBNQ4ftRymqzy37UfJOqI
	NGOe+tNULxlN/0iRUCPjV0rvvPFjijwcz6GawCK8faoGnpM9/cJlmlOCofZrRLKHSEBFa+fNPhVcP
	mtRSemFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMA8A-00000003wmr-0GGF
	for ath12k@archiver.kernel.org;
	Tue, 25 Jun 2024 17:38:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMA87-00000003wlX-1Hgr
	for ath12k@lists.infradead.org;
	Tue, 25 Jun 2024 17:38:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PGosf2029160;
	Tue, 25 Jun 2024 17:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rsckhxO2eyvlVTzi/1TuZcLt9XqppgZI6qdch4c+MsY=; b=LciV7TuMVgm4vOP+
	HPoxnvDMzi1wIDgB43a2QxpZANZfG5LZ4jrkpyNTklmlwwtieHze/TUDbwOuzy3M
	5jFaJn2ei3CpeIdbkubvkdze/0qq+/Ps7cOFTqBIPb4gCBDizWYLOY7AuQ0aC+r3
	NLglfdy90g3c7F/9TK01vapIvNIuSkN3B07LpGYbOBjjLGxW6BSr+/2JzjMDipwT
	1b2io9jylSTeJmhpErBW/Nl6PSOUct/edyC/f2cp+Ft/z0Z6o2tAJjtcCuN2Ibuy
	LW5YzVWSOats1fpAHEV5hLRncQKzxbl/rNq8oCGY97eX0ZRkfKazHQ/v+2lA5yEx
	CmgEtQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywq0779p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 17:38:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PHcoCn006084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 17:38:50 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 10:38:49 -0700
Message-ID: <56e31e2c-e174-4bee-9a9e-7378fe71ef06@quicinc.com>
Date: Tue, 25 Jun 2024 10:38:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix peer metadata parsing
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240624145418.2043461-1-quic_periyasa@quicinc.com>
 <87frt1hvc9.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87frt1hvc9.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xzchcks9JTZHO1ShPk370PK4YJfKq39d
X-Proofpoint-GUID: xzchcks9JTZHO1ShPk370PK4YJfKq39d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_12,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_103855_600933_A85C2D6D 
X-CRM114-Status: GOOD (  13.89  )
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

On 6/25/2024 8:53 AM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
> 
>> Currently, the Rx data path only supports parsing peer metadata of version
>> zero. However, the QCN9274 platform configures the peer metadata version
>> as V1B. When V1B peer metadata is parsed using the version zero logic,
>> invalid data is populated, causing valid packets to be dropped. To address
>> this issue, refactor the peer metadata version and add the version based
>> parsing to populate the data from peer metadata correctly.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: 287033810990 ("wifi: ath12k: add support for peer meta data version")
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> [...]
> 
>> +static u16 ath12k_dp_rx_get_peer_id(enum ath12k_peer_metadata_version ver,
>> +				    __le32 peer_metadata)
>> +{
>> +	switch (ver) {
>> +	default:
>> +		WARN_ON(1);
>> +		fallthrough;
> 
> I'm a bit wary of using WARN_ON() in data path, so in the pending branch
> I changed this to ath12k_warn():
> 
> 	default:
> 		ath12k_warn(ab, "Unknown peer metadata version: %d", ver);
> 		fallthrough;
> 
> The benefit is also that now we print the unknown value. Would this
> work?
> 
> Please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=0228ca402186a123e5c90187f952121de50bf64f
> 
LGTM, thanks!


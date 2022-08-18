Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25916C00140
	for <ath12k@archiver.kernel.org>; Thu, 18 Aug 2022 23:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejb9khTWZuCod84isMEM7D6gmC7okjsnVOGO2ewHTS0=; b=qM6QhM5CJMp4mg
	APBJdG8xOlcaGQOJqHC0/dlfiTiqdBSGULOuH5Hj1Ah54Z/Kq6zdX4xKDCZ+AF7E9TNh7wlKUl8LJ
	VeynO5K9bIEcdx4fihw1eWLJkdN8sFTwF78BEWW7yJICHIvCiEjfaoraJCvjkeX8ULG4ydZ5yEasp
	F6vz2ibGAKD/WaIigtamqBhpKAINcbHO3MPLDr/AqPZlotHGIA3knFm3CJ6UtmTHr0+a7S0mBJlbg
	hN/iloEDMqUOyG4qVEPWwkTOuODykf4gOlDiMBg46lrd9trvxiuxxuF/R2xiF5x1uBDHfp5x+UfOa
	Oxllsoo2dJE197aVZHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOomE-00B5xU-Fk
	for ath12k@archiver.kernel.org; Thu, 18 Aug 2022 23:18:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOomB-00B5u8-Rg
	for ath12k@lists.infradead.org; Thu, 18 Aug 2022 23:18:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27ILILV0026509;
	Thu, 18 Aug 2022 23:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=f37tqwu0u597YIQPvYVwEVI5ufA857AD2yrl5tdzoK8=;
 b=EVANMWrzFMDVPHYINy65rv1iy/mn0Q6ZV+IOoRQAnu1pITijL/7kj29+ePlcf3MrEEHr
 VNgfYXBG2EGwfOrT8zvuA+IRfU0ORQjm23ufcHN+s764T3GwXaHUlogbZaraBN8dZC6G
 h/4y/qb3UHK/pWfd/hdY1pD9/Ob1ZAlm43d68vfJ/tmVe79bhr+UfCaqGoOTYOez9gIq
 A95PgeTra9lA335YgAeI+8ik3I8Rrngo8d7HV1K9rFQHaS7hU8KUDrZ0uU+alzFjClCg
 gjvd8JRtPQ7KPmCbC80Jb8VGAYeYnRJXfEG0jLCwf6HE3YnZf+g7YQvZdkIO1EDU50/l EA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j1pwuhhts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 23:18:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27INI6N8010170
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 23:18:06 GMT
Received: from [10.110.11.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 18 Aug
 2022 16:18:06 -0700
Message-ID: <d6323a12-0a7c-af50-7fc6-d996eb24a02f@quicinc.com>
Date: Thu, 18 Aug 2022 16:18:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 36/50] wifi: ath12k: add pci.h
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-37-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-37-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gOuzeQYIyFeooejABgVp2hNe76T4aE-H
X-Proofpoint-ORIG-GUID: gOuzeQYIyFeooejABgVp2hNe76T4aE-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_16,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_161812_053229_5AD3E1E4 
X-CRM114-Status: GOOD (  13.24  )
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

On 8/12/2022 9:09 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/pci.h | 132 ++++++++++++++++++++++++++++++++++
>   1 file changed, 132 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
[...]
> +struct ath12k_msi_user {
> +	char *name;

should this be const?

> +	int num_vectors;
> +	u32 base_vector;
> +};
> +
> +struct ath12k_msi_config {
> +	int total_vectors;
> +	int total_users;
> +	struct ath12k_msi_user *users;

should this be const?

then the following typecast in pci.c would not be necessary:

static const struct ath12k_msi_config ath12k_msi_config[] = {
	{
[...]
		.users = (struct ath12k_msi_user[]) {
[...]
		},
[...]

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

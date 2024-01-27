Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDCFC47422
	for <ath12k@archiver.kernel.org>; Sat, 27 Jan 2024 00:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXK6VAxvSzZjxQyP65qzd7Sn16kufk2hYumVjnbPGG4=; b=HeDHifMqFxDVp9NF5mp0xm3jp2
	63fS7Lj39Pc8UKA8zn1gdynKkLQut97CtPx8w0E6KmAL2mlL5kXZfu9F3o4MRtdrpcBUEmVqzS6I3
	AowlTWVjU6QHbEV7CbBQSNkrxpmgtgP+pCXWDTWZu3c1BmgysK05b7f3MeeTM0xv9R+ZbLimnZiL7
	g3HTcQbgi5fP4GUk4Uly+CoyY9kwpdZnj/osrfI2MGAMa4yWNLndsmuzWm4omA5Z8oJP4MZtuenUr
	imtjyuij/l9LleSA207YWbNcBW2IdB3mgGRULtxv1O6PEyYJwzt2ubnUUUBhvt9roWmGI0J1qVPRL
	7PR0SPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWKV-00000005wMG-1wqD
	for ath12k@archiver.kernel.org;
	Sat, 27 Jan 2024 00:13:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWKS-00000005wLv-2vHI
	for ath12k@lists.infradead.org;
	Sat, 27 Jan 2024 00:13:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QMnErl004573;
	Sat, 27 Jan 2024 00:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EXK6VAxvSzZjxQyP65qzd7Sn16kufk2hYumVjnbPGG4=; b=PK
	52Ew4+7pJRWEkDDOgB1f0e9y3zSg0+6BioJXIF/dRAwHXHliwzdA1qBVxMIG7MtN
	EEkPlGiW8rlP1A3cUijBJIRd/+AJBBdS8sc3apx7C19ll8UVssrXEAVcRSmapYFd
	DuRx88e1Lj7VzGai40CSL28MARZ7rXSN8BQF2cahjWrf/NmIkQJDbGlfKfTajk7z
	1gT64zmkw96XKm0jalZXN26s+d1dvFScUnU+ashURYSYO4AUhHT1/9wqRsiJGwjk
	jjOCSlgyWMc/zjYUT8xT5Qx2rSZ8HYMfM9y47VxCuaaxLk3tujX/+HxAWnb8znUS
	R5mcj1YJZZGt7tQFH+FQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvhxyrk36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:13:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40R0DkEo030532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:13:46 GMT
Received: from [10.110.0.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 16:13:46 -0800
Message-ID: <a9a1625e-cc14-4ef0-b0a4-d849120d9906@quicinc.com>
Date: Fri, 26 Jan 2024 16:13:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] wifi: ath12k: change interface combination for
 P2P mode
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
 <20240126115231.356658-2-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240126115231.356658-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0Myx16hgmdh2wWztkw855PbK9W59XyxL
X-Proofpoint-ORIG-GUID: 0Myx16hgmdh2wWztkw855PbK9W59XyxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=716 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401270000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_161348_891215_F06683E6 
X-CRM114-Status: UNSURE (   8.84  )
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

On 1/26/2024 3:52 AM, Kang Yang wrote:
> Current interface combination doesn't support P2P mode. Change the
> combination for P2P mode.
> 
> Also, there is a bug that when mesh is enabled but ap is not enabled.
> In this situation, the mesh's max_interface of interface combination
> won't be set.
> 
> So assign the max_interfaces for mesh directly.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



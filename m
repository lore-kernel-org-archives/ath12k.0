Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C03C54E58
	for <ath12k@archiver.kernel.org>; Mon, 11 Mar 2024 17:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WtS1YJ2U0Nyaa3qekGkB5elQjNZ0aL7FSG46X/1yRA=; b=oaNP+LVAxyr6jPhdHuD+1WsT8L
	M65qTLNY6JcbsgyYcCevAYtgWdc+KS47+0ConrPux2HCBpUKcEAP3lBhIrbVhpQtUvv0OZoYsJMzv
	ZNF4bgiBMqmEnC4raBpBTtS+ZD+0Z3Fw8fwRpc0UP1hgC1bYRRX0QBMhBB0OMQv9mAr+rw/xEH3Lw
	sJn4u7njhBEAasF7bagJx1aj30Rmlk0k3cTHm51Wa+R6gEBKzlBlRDNYbo2OU7CWIqQWxa45iFTDy
	aOYRlOctF9J2CjIxnNLlzjl2+xaSgQoljtbp1lbX1dKlH6Yi1e3Gr3iIX5PMz0wRw8HeR6CND6Teq
	xl5Y/IVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjjNV-00000002VFK-27QX
	for ath12k@archiver.kernel.org;
	Mon, 11 Mar 2024 17:23:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjjNQ-00000002VDk-2Var
	for ath12k@lists.infradead.org;
	Mon, 11 Mar 2024 17:23:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42BCUaOT000917;
	Mon, 11 Mar 2024 17:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=0WtS1YJ2U0Nyaa3qekGkB5elQjNZ0aL7FSG46X/1yRA=; b=M9
	tpSDiNI5oHri2b1Y6iQDcFMaZI5tuJIwRUJFTjwY4Yh2aevwrl+yEj61Dhxokqtf
	SPPIHPxIYeW8Lc4I2Bo0rviddXse17Cz9G+iDTUelW2+JRbMgGK7jQOPXrmMXe/j
	9947ib/bED0ycd4/CLEiRiIwnyqeMM1b7BpcvXk8XpB338ykpWz3Rb1KS38ndYRX
	nyWSkfxU+ECqYI0Tgc9/LTyXMeyUssjpfxEH4jwYWHT2K7t/f+oIpAn/HOcaTcKM
	0csSiA0mvlgiGvSWJaPDBAU1yHQk9P/S+kGUZNYl/siQkXIHfQIm2I8lREpRVCq4
	f2Oc6FkFDSpHYwAefTyQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wsxgt9dxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 17:21:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42BHLKRn003746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 17:21:21 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Mar
 2024 10:21:20 -0700
Message-ID: <91902c69-6a51-43f9-8124-7b19c4265b22@quicinc.com>
Date: Mon, 11 Mar 2024 10:21:19 -0700
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
 <ded15bd4-7b89-467e-829d-62b1067e1f03@quicinc.com>
 <CABymUCN0c9HK3vC3ZFxfXkV9Ezcqwq41J4vGSkpsz09sMDL8rw@mail.gmail.com>
 <CABymUCMsHDViQ=qfyamdkpTutrXoRuhto88iQsRo6TcgDKnWZQ@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CABymUCMsHDViQ=qfyamdkpTutrXoRuhto88iQsRo6TcgDKnWZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 30M8owMwW3Cjji4Sk8Bps1gM52kPX_xL
X-Proofpoint-GUID: 30M8owMwW3Cjji4Sk8Bps1gM52kPX_xL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_10,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=625
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_102352_693457_9DD7A59C 
X-CRM114-Status: UNSURE (   8.19  )
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

On 3/11/2024 2:19 AM, Jun Nie wrote:
> The latest finding is that 6GHz TX performance of wcn7850 is as we talked about.
> But the RX performance wcn7850 is better than 5GHz case. So the direction
> impacts a lot. Not sure whether the bottoleneck is in scheduling side, or any
> configuration on TX power.

There is at least one 6 GHz patch in the pipeline that should be posted this week.

/jeff



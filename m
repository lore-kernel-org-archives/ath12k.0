Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA54C433FE
	for <ath12k@archiver.kernel.org>; Thu, 13 Oct 2022 06:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7tcUcDDiEgC+b3VOr3wsnYrauXgfpcYUEw2/OmTa1I=; b=OFn3pMON7FRin1
	c/AZkH7LTKkbnNbkjLQXz3ouzJEI13raUO4sMKrArczXWn88jHVWbWG5VzAd2pUmAKKi858i83iJI
	NU5M9CVU1QmnKBK0r1mGt7tqp3UHX7di2YI8GoTUCafBrTnOCAqi7jFKAyZcVbklDwJMM8wM9JRn1
	9dcGApeIa2P0QdKcL7pgGzo/27IxDdFZzkdZhwKAtxUXwrKsIK2VvswQOuERBekzwu7lGOewNCY1F
	l6l9sFF6Y1W7H6M5kH5pc58D3fcThzg5KiS8J9XzR7q+5RMQnGH8rZ2DZSA+zCVjMf4M1c56O0d6w
	yLwTN+6sykJuVubeECpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ois1k-00Au52-4X
	for ath12k@archiver.kernel.org; Thu, 13 Oct 2022 06:49:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ois1h-00Au31-40
	for ath12k@lists.infradead.org; Thu, 13 Oct 2022 06:49:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29D6GMQ9013034;
	Thu, 13 Oct 2022 06:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=a6U//oY0YCxqmouz69JeHfl8MwMuzHzUbsHfq5Levjs=;
 b=FuKP22hFWRUy2qy2NmEBgPrdQ8KZOYANkF3BzNbDWlBySJ+cTG9z4eS4d9Ta/YWuiLFw
 dWwkaqNwoUaHBlQqQRDOSI1Pro4xkOCMVhNFhqs5Pr6MS763yMRMJm9QucXNShFbMVAR
 GMgM31bgK+IApjDPx0XogDajuS7o2vn4aKxIAgWRs2WCPDZe9VHx2k+1sXJ8ghefN0w8
 51cywPosr2i3/WVRTMW/Y9h07fo3dTubH+niAcrhNQy5oIB6L42Kq7hecHukGjuM0nuT
 9FHiG9y/pOXTXDe3mVm9gFxNs07Lqr0ci/pwGBBl/wKjMegnCMnYGDe6Xr4+Vk190fVs Og== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k6br7rcg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 06:48:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29D6mvtH009757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 06:48:57 GMT
Received: from [10.110.65.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 12 Oct
 2022 23:48:56 -0700
Message-ID: <92ad1bee-d9c6-9244-f8bf-5fce8ddf4a55@quicinc.com>
Date: Wed, 12 Oct 2022 23:48:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 15/50] wifi: ath12k: add dp_rx.c
To: "Sriram R (QUIC)" <quic_srirrama@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-16-kvalo@kernel.org>
 <576a0720-fe45-36bd-abd1-b772dbe380b0@quicinc.com>
 <SN6PR02MB43342E0EDCE5420D93DD1EC7F7229@SN6PR02MB4334.namprd02.prod.outlook.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <SN6PR02MB43342E0EDCE5420D93DD1EC7F7229@SN6PR02MB4334.namprd02.prod.outlook.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V0AQatNCWPzD0qMrQRkzwk9hNAkelmAI
X-Proofpoint-ORIG-GUID: V0AQatNCWPzD0qMrQRkzwk9hNAkelmAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_04,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=618 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1011 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_234905_307979_E8BE799C 
X-CRM114-Status: UNSURE (   9.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 10/12/2022 4:29 PM, Sriram R (QUIC) wrote:
>>> +static u16 ath12k_dp_rx_h_frag_no(struct ath12k_base *ab,
>>> +                               struct sk_buff *skb) {
>>> +     struct ieee80211_hdr *hdr;
>>> +
>>> +     hdr = (struct ieee80211_hdr *)(skb->data + ab->hw_params-
>>> hal_desc_sz);
>>> +     return le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_FRAG;
>>
>> should there be an ieee80211.h function for this? we already have:
>> ieee80211_is_first_frag()
>> ieee80211_is_frag()
> Yeah, but we needed the frag no in this case.

understand. so create an ieee80211_frag_number() function in ieee80211.h


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

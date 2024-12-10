Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9716BE7717F
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1V4caqiYa+bRgdUwEw9YdVmfvE+fmVPLRP5BAuLHME=; b=EeBWMitZf0voWyDbkXbu2IMvoK
	bKaqdCb2RYVbekv7iuR6n88/Md6dd+KLgnmnJKNWJykZ8F47ysWN4DdOb53Ft9PfIEnrqgKd+n8wW
	zmf8m1q2lARA3HbEiSEc8ayreji2hGwu4y7vzj6PSGbgEz869vPvYvITG/pCIN0dQKtqBeXXs5dTR
	BcjFqg50ep7UaI/CA7rBn2SRAMeJ6CEXraGgRlSUHcEWMX1iV951bA02RkXsX2eiTdeHfh2vHp3Z/
	V9JFOBDqioMt0Kb2JKdr5UafgGM1Q5o7e8Fef6ikaBaty5v4iyEWIYYrL8nJXS2cBnASluzpDvWk6
	8BcvwNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwao-0000000AtZS-1CGu
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 09:31:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwa0-0000000AtOs-1ZOa
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 09:30:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9Np1W0018563;
	Tue, 10 Dec 2024 09:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1V4caqiYa+bRgdUwEw9YdVmfvE+fmVPLRP5BAuLHME=; b=Cv0KRVapG7GoYUas
	SZk1Y6Ton9jIm2UgXbbAuJ/5iXOp8Orn87qN0IXunvs+cT900FkW3uwyLqvSOU/e
	6fb989yeSkndsZ/6zESEq8VwmTlFWKXT+PlvVzJD2Yp0Jyc+ATnWlgAEW9ztBvrj
	X+0pwIEF/9zQ3asDgvdaHpK/Iv7MYHTkXuL62BeCHAgsZUHkr15ukcYggUky4IUo
	LzdwvYhyAO9go+BNedlWYu6tYMWw7apA4GXVRhUDFswBaHen2/RmdMJYrcy48niB
	b0SQ4uRFw7E30VmlzZNJkf7Ua5DeQijEswlO5S3x/8kV+5crNCwfVW8qRLsJKjWL
	H29S/w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eak39agt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:30:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA9UrCR017869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:30:53 GMT
Received: from [10.50.47.36] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 01:30:51 -0800
Message-ID: <a0b4521d-8817-ebf5-08dc-1af76af152d3@quicinc.com>
Date: Tue, 10 Dec 2024 15:00:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [bug report] wifi: ath12k: move struct ath12k_hw from per device
 to group
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <ath12k@lists.infradead.org>
References: <3e705de0-67d1-4437-97ff-4828d83ae2af@stanley.mountain>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <3e705de0-67d1-4437-97ff-4828d83ae2af@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sXR5_A-b1vJFmXTRru0IUP1PQFirZWFQ
X-Proofpoint-GUID: sXR5_A-b1vJFmXTRru0IUP1PQFirZWFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=580 clxscore=1011 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_013056_419760_DBFD4EB5 
X-CRM114-Status: GOOD (  11.62  )
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



On 12/10/2024 2:04 PM, Dan Carpenter wrote:
> Hello Karthikeyan Periyasamy,
> 
> Commit a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per
> device to group") from Dec 4, 2024 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/net/wireless/ath/ath12k/mac.c:10938 ath12k_mac_destroy()
> 	error: we previously assumed 'ab' could be null (see line 10927)
> 
> drivers/net/wireless/ath/ath12k/mac.c
>      10918 void ath12k_mac_destroy(struct ath12k_hw_group *ag)
>      10919 {
>      10920         struct ath12k_pdev *pdev;
>      10921         struct ath12k_base *ab = ag->ab[0];
>      10922         int i, j;
>      10923         struct ath12k_hw *ah;
>      10924
>      10925         for (i = 0; i < ag->num_devices; i++) {
>      10926                 ab = ag->ab[i];
>      10927                 if (!ab)
>                                ^^^
> The patch addes this check for NULL.  What about if it's the last element
> which is NULL?

In some error case, it is possible to NULL.

> 
>      10928                         continue;
>      10929
>      10930                 for (j = 0; j < ab->num_radios; j++) {
>      10931                         pdev = &ab->pdevs[j];
>      10932                         if (!pdev->ar)
>      10933                                 continue;
>      10934                         pdev->ar = NULL;
>      10935                 }
>      10936         }
>      10937
> --> 10938         for (i = 0; i < ath12k_get_num_hw(ab); i++) {
>                                                      ^^
> If so, then it leads to a crash here.

Yes, will raise a patch.

> 
>      10939                 ah = ath12k_ab_to_ah(ab, i);
>      10940                 if (!ah)
>      10941                         continue;
>      10942
>      10943                 ath12k_mac_hw_destroy(ah);
>      10944                 ath12k_ab_set_ah(ab, i, NULL);
>      10945         }
>      10946 }
> 
> regards,
> dan carpenter

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி


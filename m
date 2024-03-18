Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573E1C54E58
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/grPZiKDxWRie1IfXqAXgxew58o5InKy5FevDncIgKI=; b=TW0PLHqW2IC5J59VUavFlI86Ns
	Bi6Knm/H9+lOBfcNJrxhNAc1rHhnK/f4NZ1Q+W7JIiQVRJbvC3EzsBY0hNnaCBfQ2P0L29qDd7/gA
	98wJ8ArX3AGT4OqD5eSLf0I4SaNO2w5BQJXLqAZ+YlXEpuQT1jZ3UfwGjKnjNZvRi5xyP6jjGTgGn
	PkUkO8BsEinIbnK56qInOiAR34SwpotnOgXZmd+X8VtT+NQJdl6SgbH45XpkE/GVcGiCVYC++aOhX
	ANBeYzZOSfu+/087Wk8xC2Px1qnXFkb1DyNLRxUejjI5SPUzyJGfDvHVoWEZasnKCY0CgmF+DsLuo
	XsFjdqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFH4-000000096XS-37Vo
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 15:51:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFGe-000000096Jv-3j6C
	for ath12k@lists.infradead.org;
	Mon, 18 Mar 2024 15:51:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42IEpvCf012153;
	Mon, 18 Mar 2024 15:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=/grPZiKDxWRie1IfXqAXgxew58o5InKy5FevDncIgKI=; b=m9
	mtT1pdNjK0gKTMdGf9BeWfF5MZE87SAodH01adq0J/QkoJqJW11vPiFuszUrf32s
	4lfUgX97xVhISSqSQimXj2OdKm2cYLm9mYJxzqH1DEUMCN/c49Voh6RMzr4trRbd
	bN7nBfUrYNL0dve0TfcGI68zBC1gsiZ3zPs9ED/ZrmUeEXJK0zEKD3LQlvZHJRwj
	RiN13KKpe0cTgOekWwQAdU1MLHNDlv7vZPTDW1Td1yJrVXrO1NEv7chW+gGfz3OO
	kw1sf+FYfqyPJFrZfs01WUotJNea7ie+3jEIvL5CXW9gZ0+Edt+Y/az8yyh/lhFw
	JkctJymVqTZClCqcwaRA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wxqrh0433-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 15:51:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42IFp5Fx019300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 15:51:05 GMT
Received: from [10.110.89.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Mar
 2024 08:51:05 -0700
Message-ID: <9dc50652-ac92-4962-b60c-1990c5cece86@quicinc.com>
Date: Mon, 18 Mar 2024 08:51:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: driver does not allow the system to switch to
 suspend/sleep mode
Content-Language: en-US
To: Vladimir Mesh. <owen.mesh@gmail.com>, <ath12k@lists.infradead.org>
CC: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <CAHohoUjBQ43aX8qvT6WAK5AK3PnOyU1g3eFLuCL1f-UMjnNnwQ@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CAHohoUjBQ43aX8qvT6WAK5AK3PnOyU1g3eFLuCL1f-UMjnNnwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Tg-qDIwaeHNlFCA7X4RoCbmX2qzPQ74e
X-Proofpoint-ORIG-GUID: Tg-qDIwaeHNlFCA7X4RoCbmX2qzPQ74e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_12,2024-03-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=812 clxscore=1011
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_085116_992926_A7AB61B1 
X-CRM114-Status: UNSURE (   7.99  )
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

On 3/18/2024 5:15 AM, Vladimir Mesh. wrote:
> Dear Sirs, 
> 
> I have a problem using ath12k driver with wcn7850 adapters.
> ath12k driver does not allow the system to switch to suspend/sleep mode.
> Please fix it! 

This is a known issue both for ath11k and ath12k
https://bugzilla.kernel.org/show_bug.cgi?id=214649

There is already a proposed fix for ath11k that requires changes to other
components (MHI & QRTR) that is pending approval from those maintainers:
https://lore.kernel.org/ath11k/20240305021320.3367-1-quic_bqiang@quicinc.com/

Once that is in place, ath12k can also be addressed.

/jeff



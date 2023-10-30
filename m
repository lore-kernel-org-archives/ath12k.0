Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01C5C4332F
	for <ath12k@archiver.kernel.org>; Mon, 30 Oct 2023 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wK2on+xDtXTbmrztCjHf4hHo88ZTnZU4yC8JfEq+nJM=; b=qUqS+GXYeteiv9
	5cN6aU1Hr0Dz7jjuwLtin69Ztt1WBdn9oQM3zoHgp3cU5L1L7G54UQ0UX7jRjb4ff9fLydjUNcgM0
	kX70J0hlD9dYdCRPslj9tAaAcy3vfZiTjBcstNXNJW/6eJunSl9DdCdD34k5MMqMqXWIpizUmJDEo
	j0R1/oChNk2tLcDAcnugZiTeeqiD585/yMy7tUoAyZRhK98L3nbik864EsJ+sO7zmrsyVScjTeobi
	mOLrBNobYGgUEaGJk1W04+PhBfQYXuPgFPBE0kZft1YJ6F42DZkvDBYNclOJe++TnRmcyEp3l6y2r
	lmC/ln8VexH8E3BAEVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxVnl-003iwS-1L
	for ath12k@archiver.kernel.org;
	Mon, 30 Oct 2023 17:11:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxVni-003iuu-1m
	for ath12k@lists.infradead.org;
	Mon, 30 Oct 2023 17:11:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39UH02LB017234;
	Mon, 30 Oct 2023 17:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9R/xaPbDK3oi6GF2d9HF5+5/5BSNwCSOoDJ43ViUkwQ=;
 b=VwtiiP26HfEuwBw6YfjfUQ51geWUN2oCbeMeVlciu4UU+Adqq5fTG9cJS3jnCMqLMeED
 lDdlNFF78Nm7+drfuD3dehvHmd2Ggm6Wx29uRDmYtiSXmIJbVbHtXuIiG/shLTcN11fV
 N6xFV2EmsO7NpR1XG/M1QsJujscUYhszpSYP9HxEda4iJABugCOvKae/YT08y5SHqbIp
 peYS94iO5L/feHgAw/iWX+U/fPWMuI4QLfPvVRp++0FkZqcQj01+yLPNjdGumFgOcTM0
 sc52evKCexmrQ/tiX2qaQAtmYiabD8KwJ5siw0ayWlD6F5+3NWhNY+g/dK3EkhRS3nV4 3g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u0sw7vgp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 17:11:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UHBZOa011724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 17:11:35 GMT
Received: from [10.48.245.206] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 10:11:34 -0700
Message-ID: <54e8c4b4-4f8b-49a8-944b-a85594bee0d9@quicinc.com>
Date: Mon, 30 Oct 2023 10:11:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ath12k: Factory test mode support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20231030082749.17855-1-quic_aarasahu@quicinc.com>
 <37452ae3-3006-41ca-9b31-f0d4bed75e35@quicinc.com>
 <878r7kvycr.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <878r7kvycr.fsf@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ghb0uXBqqknsZVI-Lj_fwHWOMyVJc8wm
X-Proofpoint-GUID: ghb0uXBqqknsZVI-Lj_fwHWOMyVJc8wm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_10,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=550 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_101142_703020_C5003DC0 
X-CRM114-Status: GOOD (  11.63  )
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

On 10/30/2023 10:01 AM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> In addition, please use
> 
> Jeff, did you sent your mail too early? Something seems to be missing in
> your mail.
> 

No, that was operator error on my part. I noticed my initial reply was 
not going to linux-wireless so I thought that was an error in the 
submission. I stopped in mid-sentence to verify, and saw that the 
submission was correct, and that it was my reply that was only a "reply 
list" and "not "reply all". So I changed my reply, but forgot to remove 
the sentence fragment.

/jeff

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

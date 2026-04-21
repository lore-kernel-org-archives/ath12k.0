Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452C9F8FA79
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaq7HhAI6PkkjTf6WdCaxZxLFavrSQBcq8uqy2gDSWA=; b=lb6dJDRhsv1P8Bdv5kLLSQkVJ8
	8rLwtfCl2SB3LtXVP4CaXrYepPRRE3R44E1uY0rjIrpiJy2KbXIfypajQQhPirkdTclq6iUEchpus
	KZM05EOSvraBMQe+g6pQ4ojgsImyfHz0ZZvFjf0WG01CWJ30mJr1QAyFhHaHIp8kxJvUtAS6kZrtm
	o2Ilp7T7clGOSBFGvgGyFi3E5HtTsHJHqA771SLsqAGbv7aAQzmSXoyDDRX04U2CxnA1eXGv4vqvi
	4L6MpuMDPkj6U+xaSM6PzIXfnQEk0d+ySMMX8SkHLrzuDR+E65Ofz2oILz8UW4ge+QVAcHui0VInW
	c8Iqqqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBBF-00000008fgh-48u3;
	Tue, 21 Apr 2026 13:30:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBBC-00000008fg4-1n2s
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 13:30:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA3N7N1085673
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 13:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vaq7HhAI6PkkjTf6WdCaxZxLFavrSQBcq8uqy2gDSWA=; b=MRK0+moUpKeb3Vy6
	8uODqbqwo25d6xVuoZfxU+EuE5u0lFDpMBN19gSnQTAucCWKjMVh+cWB079DjXQs
	bnGdnm+2be0b7tHuqBDPi0+c3KZ4PRkF3YDEbMPLKHa/KcefRzIbspZptKosVRan
	/xkHZCmvtrTRe4QCSfvWdv9Lsw5W4mAqo4kgZII+pGJNve/ydqw+GSxbPXrRweDA
	DuBT02jdI9Zx+mcHYXjJ0QdQKpEg7HDmD53zkaYL91v1QlQm6UlWt4XWbk1/+UfF
	UbrfIz4UhYL3qhqw88TZQhUyhZPAF1xu9V66UtB+BBwBxC7fa4713TM6whz2A5L9
	UOc3ug==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp75a8nk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 13:30:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so4787867eec.1
        for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776778216; x=1777383016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaq7HhAI6PkkjTf6WdCaxZxLFavrSQBcq8uqy2gDSWA=;
        b=DNHdKSGyOuseTFGeMOmpygwWkrVFJ0oQILk98WfwVMJPjaGeM8wHV3GIqisVbZuaI4
         roPqNbnYzfexbD5oLuaaAmWR5WSDHmAJ2JcCq3TTnmGAoTcDSMlyYeZ2adzaQMnM5Mh1
         rlEJ5CElfmFSnv8jdS/mPBNl51dj3+8xrJJxGz236AueGeUZc0xr2tv6CJr9SYAIa2ZA
         oWONfzOPLJbL2Q5rUqp/JGEE43A2+hsg9eyGEcpe/ISTgQFOKOzkk/nIKhQTyDpOGe7N
         icWOrF5uwi293D6aWKlGdo154wan7UNloT7/TRxkyzLJ1txlLMqgVLxKhrOadd5CVNCN
         8/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776778216; x=1777383016;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vaq7HhAI6PkkjTf6WdCaxZxLFavrSQBcq8uqy2gDSWA=;
        b=hsO9dk5BP5pqitoVXknaqkAsG0biseahBgL40Leu5PdCDoTzBrTUlZo2eSEj2NvP0p
         aEx69Ln+xCXswuSImeLiBdRqtr7oOzp5iZw1WulSovuKNnezenk2kN59ccm1/rB3DXz8
         utzI2H9RjA5mZx6TQwVYrDoLiPY+JxQWJntXEs2ztEl5I5h1VF29+ipn21WdJe/fD8ei
         ivOcPBGb8/L3IVIRpu33wvYf4eb3FINu+XQUD8lwiuTyjboz6dMjEc+hg1ZZ8Wb9z0Ko
         gw2r9nnjkjeaMIRfOTaScqaLSSB01GNTbeaVWX1FzTNNvUZXcyZESiumKfz/94c5no4S
         1ogQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MTzvL9Zy9/6etWOA79welvjU2VFQhoiZRZ/q70PqF6MLV9pnrg1ybsxEH8WMX+HnZqPFkSl4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxupIVRBZ8+2v6+r5gmnF+DjObBp6VLuEnV7YVc6WDFDFdaAY2w
	DzXXd05b9wp5+p/5/ENWLaBDLQXdat4iUz/OIcexnhgOWGb9Vyej2xfdXKs4xuxUnkbbK2jeZoC
	skV8W+WCrZIH4xaUK5LE/7rqe4lwlw2sXykFQhyg/iW9Wl/bk1q8j7R7blYOJmpq/
X-Gm-Gg: AeBDievt3mAxvtOkGEwp0Iu2XaryG60WygNV+b0RTvKFUsrh5HFUTu5rqtTYqdlpa1C
	YnyW2dbPVG/HoPzp/syDtJsRnCyzppEL7edQX+j9Ets86yFEN3mxp2hy8SEJTEIOy9Ml56NpjUb
	5t+okridn2LFR2G3suU9fJhDVlxwVNsUos0JJMnqyjYNaDCXVSgMgSZnWbSHWUrBpnlv5e4rLT0
	L2dkQI0gLAE6pdX0XaD7L0nx/dZFGWrvdo5L/fkiUswHYGIgYEc76/fo/LAF3XA9Rl2qNl6emNl
	daYeHSk1P27+SgR/BwOi8YbxJ+lKcLWAv7G+yJWqWaQ3rx1t9VEIbmqNY8eXQoZ9MNCWCsk2uP3
	AuDWh7mXe3Y9kacWuUbVxRWYC2bUpBYsRU8DvINqL61uGCQ1Ju6mlyjEVx/SHRGAVNYEg2rEsxn
	Sa4J25f1IUok0=
X-Received: by 2002:a05:7300:e12a:b0:2d9:db50:c6a5 with SMTP id 5a478bee46e88-2e4528ce23bmr9313968eec.0.1776778216299;
        Tue, 21 Apr 2026 06:30:16 -0700 (PDT)
X-Received: by 2002:a05:7300:e12a:b0:2d9:db50:c6a5 with SMTP id 5a478bee46e88-2e4528ce23bmr9313906eec.0.1776778213930;
        Tue, 21 Apr 2026 06:30:13 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce440sm18480206eec.14.2026.04.21.06.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:30:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260416-hal_rx_eht_sig_ofdma_eb2_mcs-v1-1-c44a3177deab@oss.qualcomm.com>
References: <20260416-hal_rx_eht_sig_ofdma_eb2_mcs-v1-1-c44a3177deab@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Remove macro
 HAL_RX_EHT_SIG_OFDMA_EB2_MCS
Message-Id: <177677821267.4175191.2411009711200791690.b4-ty@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 06:30:12 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: UShL75SMe3CHpQ2qkEfEIY9je_g7m3lj
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=69e77be9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=V8VLkJffjg8ibZ3tvH0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: UShL75SMe3CHpQ2qkEfEIY9je_g7m3lj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEzNCBTYWx0ZWRfX9+AAnhWfnbzk
 IL1BD+lMO2kXh1KuaGE832DYZCEBbp18uUICXpIq26tura8LTvywqvsm8dQ674G5i6GXdTIZ1AY
 IX7MqhFqQ3P81wU1VZQjamx/cem0lXE12HFKg8usPUF81Y2aqtOEmlze9a7j0ymarlky7Io02Ib
 nHUhvh0TmWP/CoFcnf9Qb2rVNdcQ7ZWv+WQpvZcj/mujf+xfUSbOsFRMI79397HoZQq+C4w3lLn
 VTsVRNbAcUVTUU1BTfY500PBXeCrvdylT0twWy+D4xZwlDxWjbVQO0Sz0ulqdyL4PLcahHTC4MY
 OpicvMoj34KBULyjlwCLkb64a/IaDcOQ4ORrCKJ4P7FyNJslwJeXpgKf5y59Tg1b3gR2RlOFvd4
 N+PXwCJmZD7Vin6ANBTL4Z5iuYYRkLNz4+Sx/299Z+dNREPQzofNTF1lNkoKXl1AIxFxSpZSlur
 oeJn2HgmRWobWtjM+3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_063018_587469_E6BF0279 
X-CRM114-Status: UNSURE (   6.69  )
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


On Thu, 16 Apr 2026 13:02:46 -0700, Jeff Johnson wrote:
> Macro HAL_RX_EHT_SIG_OFDMA_EB2_MCS unused, so remove it.
> 
> No functional change, compile Tested only.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Remove macro HAL_RX_EHT_SIG_OFDMA_EB2_MCS
      commit: 5c2ab62af09f7394a538739a1b130f0c88ad15f1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



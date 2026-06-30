Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EB0C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 15:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3MfQYdMueMI2V1MlLuKgPKfUZ7shXX+zunl6VeCA8w=; b=qU3RgC7WKc+nQztpXmI1vGpu/H
	PZ5GIwTebLbVwYtjeXYAU9StY9LKGpVCCrTkM0JfDbN3XKqX4dzlmnbqiHs22s4j64qgc/evyZs3B
	E4sE74/TfUY37txx9IeOJFLDvAvr/NFJwncnG0qIkEVhzn6oQlFcGrrCThfOycO3N6INC4Gk+CD5S
	yJl5651HQgJqoGBGhh78PGjyPmZFfOHoq8Kn0RXhfmcquudbgEPjR4RA2OEJ4RARJ9anU3qHOjjaz
	qvBAxvrx2tpelPkg4N4HknQgu/K090xj56QXvaUTVxIfc4ryNnBKcr/DZOoKKcBoJ16l+wy062heT
	LDYseBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weam8-0000000HPzu-36Tu;
	Tue, 30 Jun 2026 15:53:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weam5-0000000HPzV-2kx5
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 15:53:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDDJl2213505
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 15:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3MfQYdMueMI2V1MlLuKgPKfUZ7shXX+zunl6VeCA8w=; b=SOltiwqSmQCX0IEI
	rTnRRJFGdUhvsp8qkqsXJu0C92Jllou9Emc0n+icoXGklC2LGRw6Rp4vGgRXVW2U
	ABQpTGElXgsJWYi/tVCL2M8ax2Bgmfgn9jdMasVkMRakM1C27O+b3RUtxl4QLS3M
	vbiZDeOR8wOuUF7RGIi6HnZGmSrTC36GJTs3oCkp5PttIX6vN3Cf4tv1/ET14qWM
	vZuSDB3vKaiJTEAXzVt4sUyMrrLbnk06idT14Ie3m7+7KDoR6aB3C980xFTX8xND
	yayojntVsjOX+vYu0dqGK5oaJ0SEFA5w9wohPZthsi0xjVzZzrhPTDp6Eo8lD7+s
	ktO6BA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fk2gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 15:53:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ed53abff8so2264977eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 08:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782834804; x=1783439604; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r3MfQYdMueMI2V1MlLuKgPKfUZ7shXX+zunl6VeCA8w=;
        b=F0JijV/+Vtlz3YiNFmApsSoQJ+e6iF65894A4hlIJiF8skIW8opqfwGup61ya1971o
         q41Zb8DV7MGONywyWIPVDj0zMEk7pqGbRk7jNasHZg2YTfS+3O8O6qqQtcv2q+TL6EK+
         fbalACv1f+xcVwqKIzIS/Nu3y2OUj7zLStv1EPibL/I5ImWu81QQsOtzvj94bOZ99oRx
         Fno50y6cBLHZtiJXfTg63hTIYU6LS/Duqc+X6a8SYWf13hucq4YGWf1xOgqEbfYdyBj+
         lsxkpiUxTDe4ZznuZbo05ehjXv315ORSC09J+gCGjddtBUyHkkV0zmlNikYAR6E1poHf
         t1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834804; x=1783439604;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3MfQYdMueMI2V1MlLuKgPKfUZ7shXX+zunl6VeCA8w=;
        b=SdiU9tbydYybE1jyOFPe47Hk55kjU1/NGk0uQaok6lRYYu9M4K3WljkIieFWFrG62J
         SjoIZEC6zAM0gXlT8XMVOvkdiJuh+4XLvYwKeocDN1L2bOOvHh5QUZdEUJ3AQLaXoG/y
         S299jUR+fJZL/pIZb1wVCOKDxdTiGv8JllJEhwxfW1ONPNbcbygZUCsn48/aWKSQVyOo
         PjVGlkWpp+RxEaDliBvsP9hgjRvJpUdJLAzjjrEDF1v/LWO92sXtwPv2Cld5cq1JQs7N
         X2+vTqypx9g4cvCTkO8T7zoiLOX85xxk5bCyLXGD4EXcN8gnjTvYhFFXqBwz502Z+yrX
         9orQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYY3Jin4l7cI6RcSpJDOmzGdzDOcen0V5DTCTa73N+rvFR4VgxiGiULwCTklH5qzABmldFZXs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKfBDLVdepH5Gm10FJ7mpnYEIATVD1Z3RPk17V71wSN+BaCbps
	Iv9m32EK6UKFne8FMAmx6Nk2ne3BUp9bZIisevYWWYXQmHT0op8mUQnRoo1Lb4fEm5DzJ/CA/+o
	A3puiy4cTBVAdg9SRH9stsGxiQdCjDSJutYCQ8JIupJjHhfqV0SFr11wlplMYC1So
X-Gm-Gg: AfdE7ckXkhDA1VIPss/Ztn/s9VCBdAdGtvKY9WDF77WXj2jsHgojNdmo0UsG0Ro5Qol
	ZqeIXL1XN1f/uNrA1TWsXju68CeM7qm8qEAGecm0dQS2Cr7Y9T4nNeCggXJPrT/J+KdzxfaLqdb
	zJavrjilZtq9svOxG0C5EuAtMtPcgqzCjCuKu6QOOF+BtQqsh16RXxu5RcTsFAbUrJ4AENtib1X
	GfnhYqKQFC9EOYPtuYliXq0nc/Y4SFVmwS6S29TGjoA/j5SarFIHkjamoTn9kcFUxrNT0CrseEt
	uQTFKuAPuEVYX92C/TnB96Y7XLqhq0m9cwlP6zrBMx9wbMXDXSBHxtqSFaYITeHr+CYidkyqzoP
	USZ3j4Q3gwWE83B79pOcOTZ3RUrwJhYRuX4MGAcP/x98lmOY9sp2AgwUGK1+6Zla7d9Ek5iE=
X-Received: by 2002:a05:7300:50c:b0:30e:cb91:659d with SMTP id 5a478bee46e88-30ee146e345mr3369343eec.22.1782834804313;
        Tue, 30 Jun 2026 08:53:24 -0700 (PDT)
X-Received: by 2002:a05:7300:50c:b0:30e:cb91:659d with SMTP id 5a478bee46e88-30ee146e345mr3369302eec.22.1782834803623;
        Tue, 30 Jun 2026 08:53:23 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3170ef9sm14915810eec.16.2026.06.30.08.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:53:23 -0700 (PDT)
Message-ID: <4db87d04-2de6-4521-8da0-d80b036d216a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 08:53:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: add QMI capability negotiation
 for dynamic memory mode
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260626084327.2022076-1-aaradhana.sahu@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260626084327.2022076-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE1MCBTYWx0ZWRfX4Wcsua+471y4
 x6GBapv65GpJQ1Wl7LzK5Fww1HBakcVtttKgGm0DoF9FXdnbGRwlsyobQGD5c4Q5Lyjcue+pJ6m
 JXN+RryEo8PhhXl4Z4va/YOPaHg0Z6WbcvK46a9zQAyr+WnctZeMUoCsxciOFu77ZUfQFa772v/
 vuS8SiurLx65wwCXhndgMIHFADDOOmg19BMfGhjyMAA9Qop6AmjYwJfqoBKW4L/FdpYm81gYxil
 fb0ubGscFxe7oFwLxR6qjFwlND/olv41G4zb5fqSOzAgte+F1JbvOOujrB7lGTEusVbwO27vSb3
 vnlDVTvNUlSZcnXvJUoXMM5SrgU4x5J8v20rmD2ComSILGstva/ivbifOmJ3QPLHA6wvxGPsbns
 aWCBfQ98lci+mQyRZK82mBPYF4vGA1c0KDPA6J7ZyyzFI5AJw4TYqBQPRi4wRqU4BSbxLLuSQ64
 ZBOkSjqBY54SJUtwcYA==
X-Proofpoint-ORIG-GUID: P0nq9-E3cvDo6GQcEbx08HeqPwCwr-mQ
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a43e675 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8gEmGG-DoK4_G8SOyWUA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: P0nq9-E3cvDo6GQcEbx08HeqPwCwr-mQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE1MCBTYWx0ZWRfX2lkXokC9qMaq
 C5tbA7N8fhF4CTqabRf/J8Fu9+L2SUfMGz7SAZuiJ2dCoycGzM/m3NjbrjMOaRWZhsBXvjGb4oh
 qlet2ImEP5uUpgX2TC8Y8Y7071aEx+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_085325_702095_0D1007D4 
X-CRM114-Status: UNSURE (   8.95  )
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

On 6/26/2026 1:43 AM, Aaradhana Sahu wrote:
> @@ -2319,11 +2360,14 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
>  
>  	ab->qmi.num_radios = resp.num_phy;
>  
> +	if (resp.dynamic_ddr_support_valid)
> +		ab->qmi.dynamic_ddr_support = resp.dynamic_ddr_support;
> +
>  	ath12k_dbg(ab, ATH12K_DBG_QMI,
> -		   "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d\n",
> +		   "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d dynamic_ddr_valid %u dynamic_ddr_support %u\n",
>  		   resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
> -		   resp.num_phy_valid, resp.num_phy,
> -		   resp.board_id_valid, resp.board_id);
> +		   resp.num_phy_valid, resp.num_phy, resp.board_id_valid, resp.board_id,
> +		   resp.dynamic_ddr_support_valid, resp.dynamic_ddr_support);

Your logging change conflicts with the one in:
wifi: ath12k: use %u for unsigned variables in QMI debug logs

That one is already in my pending queue, so I'll have you rebase once that one
lands in ath-next.

/jeff



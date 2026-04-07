Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFD1FF5106
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYRabF+RiYhaedAndJ0qtT5reBRffHjDq4Sz6B2n9Wc=; b=D6GYd2tu3er9cEPbR3yEwkZWEy
	fn7jzUgc6NuEqumDPntyIeSp8KK0qa5gHQ/ViDFXlwzkb3ovY67PZR3EI0fh8Y0rvNmvMVn3GBSxD
	wcDzDGfkoPbBI/t5/2giYY4uXTek392xuPAcjX/eglpyxnIVS6bfYdZKfu/3E7GyrYbVhwVmumjgJ
	dSJ9XT0Hc60KIGQuJDz12okYqgpfrMbnReYSipqeSO2Cad9ZbQeXFzHsWYQ/KoyRSBfKoHrM7xABT
	OHW2QFcDECKJQ+45sypKjzsQXGCC7yPm/qj7oj3DVH2nyQ0I49UoiRLEKTL5SNtmtbxTGzftJ2tKI
	Xuif70fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8GG-00000006guU-2uLi;
	Tue, 07 Apr 2026 15:22:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8GD-00000006gu7-3h93
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 15:22:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CMiC62328036
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 15:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYRabF+RiYhaedAndJ0qtT5reBRffHjDq4Sz6B2n9Wc=; b=h9Zk+yUOz23GTOhc
	cZbnl3Ik5WMdcQ2/d8uuw6+rJnsmeDlNEcO5+2nBLXyYNzU/XdjV9DHdnYs20ka8
	2EhdY1VWgNMhRlPh6eelQBq0BWD3zt9+ZQ6FIebuhtCtURACCS3xELiQ7AY3SAb3
	8FJsaHYt47JM+5NR93W2u4TZ9BdrBPFZApBegsoHdr4biA1eyjHTXFrEZcv7i2a4
	fMEGkxDmFx8pZmFAgwaRHEGaz+L9QwIF0LiSdi7Ylc8w75JwJ+jwrcI4wXH/Gv1q
	9Hkg8gXUvbTAnDCkJcBzohsUrrm4bcCKo4q2jiYg3dRbAwwcOHfxMNiSnCZF8UuH
	5L7GGw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4ub0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 15:22:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so30877349eec.1
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 08:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775575356; x=1776180156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYRabF+RiYhaedAndJ0qtT5reBRffHjDq4Sz6B2n9Wc=;
        b=XvQfMDHqtp03UVwRZug7d7GanSomOM4sabjpllYYzdXB49gFZ8c6czpLkYsASJknAU
         Q9VmYnREsduUZxPw8FzzyDRV6kHfAZlb9AZ6oR6i4Ait7ZeInTtE8uGoAOnewOlB0MYm
         FKqF3N6xjDlL6mzFBqZpnmjzi9s9juuqTwN5IoAcTrPWGtsi1gpz07zqrqzn9gR3cALS
         bMjZ9Qiv9icUO+xHCSbBabkurZ/pVkU+/jacVuv+Q7maCx2rG2QSN6LW+HYnLEhbqpSZ
         Q0vasTu01oSbNqo1ezPChiBlBhrWzKWylz1ArPvsPs6dx8D12ixlM3HaI5aSEyzYxAD5
         2Qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575356; x=1776180156;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYRabF+RiYhaedAndJ0qtT5reBRffHjDq4Sz6B2n9Wc=;
        b=lb6FQkmmoQfkmuWRBjAtSp7c0Xb0xNxuevGx5DmwD939aQve35sVcj55qpbuVxPn62
         vu3rmk0X0OZkES9PXWE8S21POyYwpzpy6FdsKsRtgk4PaUh2Ro5+2Qw/AFStDIMtsqoC
         eppFnT4+DuNJ+E7X7Qy2YaRzdTN2h9hnHaKHGe771xNvNF2Sp6cfkyVxD7DzLBSoqpKw
         B9r43P4vPBLd6/emOMCk8FlmJ7dE0X1US7vw/GvxkezhRcV9rdZA2YAilFKxfvH6z6B0
         gZyWJO63yrvXLOz+K7Z6DMcGrz9PE1r8reJJzU5JTZvEs/TYy3dkuZ0ICh6rB3zvCwvZ
         jOtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUonepDnLGplY54tG3koeKTp0qbVctZu7yeOMR60gDO+l9Fvp/3QhQZCRC5SsuqrDQboaZh6kg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjeEUpmAh1gfzD/jNQ/hSFjv8s+Qu9Y4I0hpSxAS2QKNBr01Y9
	tGhG5/+mIpejZ+nISyBMJ4dSSnPxG+fbPsbzIrGsYqzNiHgbpAAEyN5dzDfPvtk5HyAW/ekOaMr
	vD6+Nh3gkwtdHyjic58HBuAXvKDwp9hb/GJrA353kwUxkXU2vlciL7aJbj5GpqarK
X-Gm-Gg: AeBDievaADFP0G5BzDDa5QMF6pByEtqFSRNjvoONTz5AHOirEdLnlgN9VEk7BeaGVzS
	SBaP4Q+3Sf3UM2UpEiX7YVM7eO43JZ9lYcxkMwDowvyv+Vz0Sw6pmMnbeLGf/wim2VnnZQy81FL
	wjHS8MN6c5n5qgYytWi9BS1D0FETP43zljoDqhfg8zs4WOAuoGJOFWxbLWnu2hb88TdCGuSGrkv
	06BWKg/zGtsepq/0p380g0nbJMP6x9vY4r8Tr2C1FFmx7O/ELEAPVKYO4k5a/9akyPdPTUJ6VDS
	tLSfR5vuAyEYkx3MWyPFV0+e+WFNAkD9XjKjsIxA6jJBpPWDKQCzgAk0TL8D3UAbWjmvbv/hRCh
	ySfjBpwgCwZQBVQKngIlQebRYm/L/ufofv01mZR/xJkYnN2fgoeChcKOruKzKvxUHz3/0fPwnk+
	QQFJUPmg==
X-Received: by 2002:a05:7300:824d:b0:2cf:c1e7:521 with SMTP id 5a478bee46e88-2cfc1e70755mr3066744eec.17.1775575356335;
        Tue, 07 Apr 2026 08:22:36 -0700 (PDT)
X-Received: by 2002:a05:7300:824d:b0:2cf:c1e7:521 with SMTP id 5a478bee46e88-2cfc1e70755mr3066721eec.17.1775575355744;
        Tue, 07 Apr 2026 08:22:35 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c151sm17619573eec.19.2026.04.07.08.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 08:22:35 -0700 (PDT)
Message-ID: <b8248f7b-84c5-471b-af58-3a655a7af95e@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 08:22:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Support channel change stats
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Harish Rachakonda <quic_rachakon@quicinc.com>
References: <20260326050641.3066562-1-roopni.devanathan@oss.qualcomm.com>
 <63acfa83-753c-4b45-8f11-8e18e760cbf2@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <63acfa83-753c-4b45-8f11-8e18e760cbf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0MCBTYWx0ZWRfXzo+zOpp3sme7
 W4efEoOf7jg4rC9ouB2Vu/RTEclQBfcWzSFWYV8eYYYYcH1Knx1mtjmQ0gGMH8QDJpcQIHxsESF
 UoTiSNd61ttQ5P3+LoGJOFvgNcOMLkTCKd0woz4CFOXTMsdluGxCyZbBQqU5y+SzaxyAtjfxRMa
 xGlAU0rPkss7T01+1B02SyugvrZNCbWO1zahA1YJkAfWPNIp+wF5OyjLZ1DKN+ALUF6ItFSmH/F
 XoJJrMxO9qOeROwfTSWMq5l+rTU6DI1j5PUqCRDwzUXfVyzH3+Djn9TzDs+Av2kihFQ6iqGBMaz
 nZpmO/dQSCOSIoYPBh4e+j6eXnm8EHkMcpPApkw/Q5Kn6KpOp6Ep3FZKGC5qOAM0c4Uzy4/AvZb
 tP9Ug4asCbqlZQiF9pf4Clwi+Dz930FbENIrjPgDhPL0RbcpKJF/ZgQbrqKD2ZLh2O5PLTkhOym
 PebUIQQSNqFWaIWCLeA==
X-Proofpoint-ORIG-GUID: tBvh1zBTKd22c7w_WKwKFVcK0rZM7TO-
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d5213d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=oa6df1jTVhldLQ0IEBkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: tBvh1zBTKd22c7w_WKwKFVcK0rZM7TO-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_082237_943967_CE84BB26 
X-CRM114-Status: UNSURE (   7.53  )
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

On 4/6/2026 8:23 PM, Baochen Qiang wrote:
> On 3/26/2026 1:06 PM, Roopni Devanathan wrote:
>> Note: WCN7850 firmware does not support HTT stats type 76.
> 
> this note also applies to QCC2072.

I've updated this in 'pending'

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=a9adb8f605d5660f1db49f8cbec51ff73b4b7be8


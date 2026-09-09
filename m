Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5925C79FAD
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 05:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28mAXJkgQBElGoPGawNKKV0hbSPv3nmnTLTFUMINKVU=; b=sqdv7fOTxS5w9GK2qwrVc9h0lG
	dQERtjxl9yFM0ZBYRBIPnG5Knp2urTK8vDMizAw08RXDWglS0IKic6EbsYw+/ITx4IbbAr4s0HOV9
	wHzhD1xLOvUpdB3vVuG+Vg01lQyr4+robOM2C6mPcBEWJq8Vhz3UB4tRLAinhDr7vHpgHTp1aEtTV
	xDrG40lQOps/6F+qlMZXr8MbPRJY/g7JewgA5XB1Ni5ec//1To3Zs0H64HUYBDU1hNkctrj530JiU
	mj5P7hR8cU8W/t+F4ofAEbN//X9FJ/MbKTQJCnD9j4NyatXaxcorsJPMpDYSqmbqM5tElcpdUC1wX
	EllloPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4AtS-0000000AnMp-1Tgh;
	Wed, 09 Sep 2026 05:30:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4AtQ-0000000AnMM-1lEn
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 05:30:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MfuAN3653859
	for <ath12k@lists.infradead.org>; Wed, 9 Sep 2026 05:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	28mAXJkgQBElGoPGawNKKV0hbSPv3nmnTLTFUMINKVU=; b=pnii6YVDyStQHVvs
	ML27+6xSC873SG3O2F7Yap4F14W4VjG0Eq2dlyIbmyki8KCEBtASYrtVO2etPonJ
	OUV8ptkukVPVUB10nz8SgpVFq1AhklvSDwzMgPLP73dyV2y0Qlgy81SKzqFlKR/N
	4N+AQ9wbT0DoYpeY/wy7PgnZZ7l1Aul0HbP4YzLCtVl8UHP1dynU7Q+HaIQ0BhG7
	3Uk0GtYzJZAhRs0pemEdDtuxPnFc2Fy2xzqo1zCwiEau75bIQ/PxTEdKvwTEn3ej
	JvS+p9Tavo2mNOJUGFYFuA9Rc5sCsn3KuRcTwWbqy88Vu/HnWUWii+ZsaVPzAw1D
	I1GmTw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjppp2j04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 05:30:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fb956002so78352895ad.1
        for <ath12k@lists.infradead.org>; Tue, 08 Sep 2026 22:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788931843; x=1789536643; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=28mAXJkgQBElGoPGawNKKV0hbSPv3nmnTLTFUMINKVU=;
        b=HdBbMLMPwqwS+tDcYbKp0PBVkboIx1OlI1GbJkaMHA/LQzH3WNc8KQ+p/lYmT/UR5N
         wIu6IHllOPMBQwvtYCpAMGakndRlOc0innghTKM8cjq8rIGYiskYvioJHpHv/nHapoCn
         5jnqGfrxlVq37hMV5STUCxJfGkM2LtUiv4Ox2GGveqIBDIAndHYS5+CovAOwV/55ED1V
         l7Dq0fHOrjfXghp753+HIBxDN2FYTWYrdph+ENRpWsa6uxir0dQVOY3UhY9NA5I/tzph
         uSOEKmwqKG2Fx9bxcuUxC0fWE62E2TYakwTL92gFHF3ioFSmqOsyEVOq6GQx9gms5Tq9
         LlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788931843; x=1789536643;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=28mAXJkgQBElGoPGawNKKV0hbSPv3nmnTLTFUMINKVU=;
        b=QpdX8Lb9V4uiskFLSuHKppu4c0sQhS3AGWUc8rk/RF2EYwa39dzIzomAGxDXs9bhJz
         6CN/wjwIgYgQwyvahjkxfp1rL4jhnNIDfKMldsSYxxw5iivMOLdUPzU5ad2GmWw83tUx
         qx8z0HjC8fxkTyAvSCIrQOEoTziPiJSDvTDo8VwgpIod3KeP4xqqWn+h1uddwJBF6tp4
         a6ga7GDLEc2GTreC+BcNPfGd4LdJ7i/in241mUTcFIYL5yf1rpCeC9wfctoMimMaZi9x
         VsXa7hiWexGn5+GDg8JwHqHc8KPn85OFX/7nhRq3zVtybF9RFRmgoDW3aWznNnAkRase
         p6jw==
X-Forwarded-Encrypted: i=1; AKwUvByk9qGSdOvQR58ZpZgPhVW2GWoiQ14Mu2ZsSb9J1qtzWOvBF8DVv74iCrhV7RpFUuU36qnhK5A=@lists.infradead.org
X-Gm-Message-State: AFuF++l2xcxDtf6Zn8bDWEgoKlwu08LkhraPNKCQPg8ctYbTxoPTa85q
	3fIXNZHQjlnmu94dlP5bFy0GhggCYj6lEgQW2xsGK74AcfWgUztlFLkF6jFqaxVUxtMdhvdz6Oi
	ZJwWkjChroDAgp+eYkBxFOc7WTg4zpMogSyholkFk7Z7SlzgprY0ed82jFM3ix/88
X-Gm-Gg: AYBFou1yPpTDPKqkRw+jqvXCsKMooDHBMbbn9aOaSirSi+2jGSvcQ5BdhkIGa1WPWAI
	52qxYxdG3qq5Osz7DLNGrKSXylsbJrb82GolBwCPneXe1j0F4dgUFotMxf3Oziohsa1Uq3iasfn
	QnCbIVnEZT+gwSqoEV5i+7UX16i8raGT77brhTQUiInuo543g6EUhz0G2xsqlvLadGNuKyyxeSY
	XCYytruwebOMqFNeQsRXhf/BKu3mnbNl6B/fWFzY2lsOp4FDD1epc8mkJO+eQmdNJ0Pxh6IDTLB
	6g5njxVP4OiJrmywPmn47eIPaMPr75ZhFL5LSfBsCVli/yjiOZOfEhhipIzC7Hs91wmAKPTfL55
	tMOkIc7B41eFXky74AhB4VXZXTPuhIM3EdNfstpSKwOoIbQr3ZTuhWQs=
X-Received: by 2002:a17:90a:fc47:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39b2627fe24mr46062854a91.25.1788931843151;
        Tue, 08 Sep 2026 22:30:43 -0700 (PDT)
X-Received: by 2002:a17:90a:fc47:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39b2627fe24mr46062791a91.25.1788931842592;
        Tue, 08 Sep 2026 22:30:42 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm42457453eec.27.2026.09.08.22.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 22:30:41 -0700 (PDT)
Message-ID: <83dfc5e5-6715-4e31-8c25-0a6de9a5ded8@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 22:30:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix stale skb pointers after
 aligned TX payload shift
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260818-ath12k-uaf-for-aligned-tx-v1-1-d6ae195b15e7@oss.qualcomm.com>
 <4ed6651c-b1d2-458d-a210-5cc72954b48e@oss.qualcomm.com>
 <aba5d600-0d8d-44ca-9367-7cdc145e9732@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aba5d600-0d8d-44ca-9367-7cdc145e9732@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r7c-X6FuWYc2_MkAYlQYNX3MTEnYp-nP
X-Proofpoint-ORIG-GUID: r7c-X6FuWYc2_MkAYlQYNX3MTEnYp-nP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA1OSBTYWx0ZWRfX/GMXt10BR3dX
 uU+STX8xgpa7x0xMnoNV6MvaIwtaqdAHY72ZzCIpaMOfj/7zA5cWJAWTveVmuZb0nTRZl+ciOHG
 3dA/ncD+teD+ZPT8Nffl6lMb4eF0PJew6rj0708cGGrpS20VaUEX2GqJuCvJb86PqcWx0KsMTsg
 afiR6W8hagQuxZ+e3H702DjDhXfjZCahkqOtaVqQiDmvO8cS7VyBZuWjtP4Om07AEUzmPbVgt4H
 5pl6R6Suxd2sImYUR3NFxTqLtbbHEK/TBRrYKwi21qlpHD2ZuSCeqSfuGG95/G50m1wQbPUBFiq
 2qMwnUruntcYrJJdWHGTjO2v1wJAqSJH4YESVmiMp1MFECi9psSRV1kV99pwEZPphRfU/kXVhHr
 R0Bappc13Dq74BrGUIxE5OcBS6v8YF5TEvBaLgy0YL+gkw1OFF4Hx0uWb5Hx0OSZqaJ9311nL7L
 1Hch/jAKae6u/Ok4MkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA1OSBTYWx0ZWRfX0Tah2/bg0lNn
 nHg+5NAxPwe+m7SdRoqe1b11iCO5/ic68WdttQMHiKK19+ZFCsEHTV7zBV4GwTkvRnxFljBGd9a
 +q8j9WrSUJ0OqtqH5ld/MbRClN3c2So=
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6aa0ef03 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=f6GMtpyFpLIfDJgts9gA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_223044_472953_9BCA9C69 
X-CRM114-Status: GOOD (  12.04  )
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

On 9/8/2026 8:45 PM, Baochen Qiang wrote:
> On 9/9/2026 4:55 AM, Jeff Johnson wrote:
>> On 8/17/2026 6:44 PM, Baochen Qiang wrote:
>> So I'm taking this patch as-is since it fixes issues when the buffer is
>> shifted, but we need an additional fix to correctly handle when the original
>> skb is freed and there is a subsequent error return.
> 
> agree, it is a different issue hence deserves a separate patch. Do you want me to submit
> it or you will do it yourself?

I'd like you to do so. I'm buried.



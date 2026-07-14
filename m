Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17D3C4450A
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 18:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+5TrJoGURD9IsGPvc967TunM6WZHJBwBoK1PahMXkU=; b=FjVqI2MDZqi22Gs/WSVWQRhDRq
	yLvdfEBWMZdEarm2m5btJCzToMGDRnvvBZJoXoe51KhgJ+ZI1/6vF3stKjMxHYVUnlGvK7p1DaFm7
	kVJX4wRlORHYNJOHqDF3cCXs1EofzdDndMFoPRJCFzmNecDCr5jj7h19NoX/zq7fiYpaG28FczGPg
	Pikfqlmr/uvF70Ch7aQFdAPPSSpvHh+J6NBnRVh3idMIK/Psssxuz92EbB26dTQ466vHILhqdXew1
	3r+SzXeIUmYCZeUxOfkLL5mmlV4SZ3i7r53gxO1Vo+GD9zLHDMUn590o7SbsELBbNOUgSZvMqkvXK
	GZ13eW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhY3-0000000Cq8t-0Z5i;
	Tue, 14 Jul 2026 18:08:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhY0-0000000Cq72-0OU2
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 18:08:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EHa4fN1210941
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+5TrJoGURD9IsGPvc967TunM6WZHJBwBoK1PahMXkU=; b=Jvy6dpCAwi3yy9TA
	P8+4Gbc232HtANdQfoucgoKDPeYltAjwCfLPgwB6/MFM6MbWlEjwHqnvpVMFquBD
	oxksw1Us6lE8khfUDHlQtdr4DIZLCYscQeDJTtZScKwC+wrVD+2bWGkB4Tnnm7x+
	2ii5bOImTwjW9SrE314JBYRBe2RaO8Sew8ZC96U7OPjirfw6saEfnODCHQJZ6CbG
	1e2ywUJX+O8ed0PP0SCNVVnsMJi4hrH+/SQ166AarZ35Pa0DbMPO6VK/V5TxWa+G
	65M5vqBtXxOUJj+L6buU626q//UAeXEXKhFcemS/mVTKdIGXqH6czSDnOuA24+r3
	d37r0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr191x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:07:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5740so166821685a.0
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 11:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052478; x=1784657278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+5TrJoGURD9IsGPvc967TunM6WZHJBwBoK1PahMXkU=;
        b=ZwJpnGdjSSxUNe3LEAB9n54+45ULpJUIceUMru5i0jBe3xlGdDL+mVYv3TRHKgRAKr
         ekfvLEf2tMJFncPTbHuOdEa9HyzXL2hYWyDc6ZgjSgKmQhnL3NryMkL/U+LUs0Lqd4eB
         IcUrwCQ/fJk8hfd4T+OZX/aQev+7Ie18MwvxX44niUpbxQn0Vwq5LHPW/7PaqM84+sm/
         MLUMWb8fXtlDBai63O+qZeO6sdTB5ViAsNUUO0r2UJJQ+Ow/8VntGVdmuIquVpPjSqXl
         WEvsCB8lmRhwyNxSGXYfNEa9l7Et5zKw/fANuFvTW8HnqwQKfyzCMxsI54no4sYh2aV8
         k1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052478; x=1784657278;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+5TrJoGURD9IsGPvc967TunM6WZHJBwBoK1PahMXkU=;
        b=pQmMvd0TSOY47BUzpPNk5i6xuTREcLwKvNbKHJeD84GUMP9n36IMMWWeKGmJNCzmBm
         hHPHtlQxhURW92wZL47C94EPqcYSDT0pvAfNMiz4Wg3y7bzIN5U/lCjPPcPeLz6/KpDI
         q3x532XdbwwHt2nrNSljGfTuzJAe9j3ps+c7Abtz8z9k/ExG9C3jrt5Ud8Ce9DTvVFes
         6kuAOEYLj4fyqXyQXIILuCsxKgM0EOhEkLNuKV0Jr8TVPrxXWZmLwAJm0/jiPSWrPn73
         C3r7c10WXAJ5klV02A1+oiCLdyguRxGl2CVlSmfuOBd3re23iUNHY6IHzgjaRx3RoP3J
         IZpA==
X-Gm-Message-State: AOJu0YzjBq5sQ2LjMGT2tTT8GNXAQud21slT9kmSbWOmcSjGXlP/5Qbh
	kS81dKioQYsoMx7lfqYoMvA5HTXMEfquR5Up9/PCxzwzGpLfYLbkoDe7XBiMGSFeWJ255CT4ig5
	TKOawFnLWDhFyIFmgKb25si1kReCpvi8DbMig/1EAn1PnwQ32gZP77Au7WdNV2Krp
X-Gm-Gg: AfdE7cmAQXjXeli/Qk54C1yQvP1RuBfXoU2JC0gvl8MuqHRkVoOatKzgCZ3TzBT5Hal
	T0Snj9LzwOivOutMbPjMYXFropB4HgM97q3+z3ArWJtqSV9U+JQj/OB8H3/ga53cu06GwLx2W+N
	N9UtBHg/Ai5cv6JVkEJzRzmHCIF+O0sTi9Nel8RVJE+ld35i9fPwbxWB8jnOqrlzgkhm5ybqrnh
	NAUW6QF7CwigcN7kiPTQl5HSGz7IBv7CLday/5eHRmC7wuqsqlOidARLyDFVcHyvpeNYzkDe2N/
	OZKSfQaA1A+Xt91tHWDkJs3vKzvlnkkSdx4EbcAIbC6S9NUQGwjJIAjPGs2aLEOQBoKBI57UJ8m
	vqol2hxEGv8sL+Kf5+7P5ZjOXl7JwWk9vstbF1jWrl8ObYt+fGRZny1hXE5FeTsmgbQ==
X-Received: by 2002:a05:620a:1b92:b0:92e:675e:8ef0 with SMTP id af79cd13be357-92ef2e26870mr1282274385a.68.1784052478303;
        Tue, 14 Jul 2026 11:07:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1b92:b0:92e:675e:8ef0 with SMTP id af79cd13be357-92ef2e26870mr1282269785a.68.1784052477648;
        Tue, 14 Jul 2026 11:07:57 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:07:56 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20260701041611.3077185-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260701041611.3077185-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v4] wifi: ath12k: add QMI capability
 negotiation for dynamic memory mode
Message-Id: <178405247522.4102418.17700867963490080440.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:07:55 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfXwpHUcUV6WejL
 ww/kI7bdQ7lYO1SVJ8m0nSkIVhC4cN369YuuUuGsrfiBHakxycLNXeCwZ3NdyPFo+KGH4AFZ8ew
 gXVb7uRvjmTx0z8YYeKr01NIbU7Mv0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfX1wAkferDmbI0
 OTJMhS5XqloXUmedH/DL6AEVaEtHZcMQ8g3d8nZuvh9zo2PiW0lUIOClHV+uoj39NoH9t3DqsHn
 Xlkz/ff6Q5f2z/eEtBLUCi+9SDWioj0Y9Hpkrv1jaNuzUHiRg84LWmNcqXQdV9Nl0cJmFMRUz6a
 yiwXqvtCIwz6xWreDJ87nhJyaRu15isr7UVCqOuFo2X0ki/ayUQEGbYUh0qAn4hG0vDcedwNlYR
 EpN1Kjel1sOX+Ey7S83M+ywS7CLSQ04uI9AOwe1rqbwOlva3h1TmvGUrCiWTVSuSJ9QDl0kzHs5
 ELj0e8JK83AebkxOwjMmC7jwq06SHAssiZEViV0E3Bsz69BzMPVu1blOZHLmylPVhKekuK3jx69
 k6k/eaYFbySBatZlcjDhGg0AKLnUezCTQdsoDafqCQvd6+XydBnivQGigPdc3bPjVRtv3QBumq8
 VSva134rv7wJKGk4YoQ==
X-Proofpoint-ORIG-GUID: flMSgRZDB7o0OdVvh31ZO-BOdbnKng3-
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a567afe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CcOsbiKdpNObZueyBOcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: flMSgRZDB7o0OdVvh31ZO-BOdbnKng3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110800_259786_A5786080 
X-CRM114-Status: UNSURE (   9.60  )
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


On Wed, 01 Jul 2026 09:46:11 +0530, Aaradhana Sahu wrote:
> On AHB platforms, firmware operates in two modes: fixed-memory mode where
> firmware uses hardcoded addresses for memory regions such as BDF and does
> not request HOST_DDR memory from the host, and dynamic-memory mode where
> firmware expects the host to provide memory addresses including HOST_DDR
> after the Q6 read-only region and relies on host allocation for all memory
> types.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: add QMI capability negotiation for dynamic memory mode
      commit: b93c1dc446847165fd4cafc3d4d1c67ee6c6e987

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



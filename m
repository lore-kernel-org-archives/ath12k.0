Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED138CC6B39
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HVvCN3iv+As078Gmff0ARZxT6mIW44MrC4GBBlAmpQ=; b=rqcvqhMhi5ELgTuuj7mBj+WXlJ
	ovy6i57lZhi36yU7A/hxJaivjfjx+VYuvReIZMll8kSKJFBOpg7Zp1aOEhogt33NUoxb6fWAS2oiM
	WlIG9HyrAxUdWN/bd0FJzUdhh2XsCVhhx1doZpsvwj++dYKz3oCqtiLNPnfUiFUIss5tk7iaHm9ar
	B5lGOGcZ61blKWOF0F4CVMUN2+EYXjt3ceSXqDpvraGo1tKbgfyiXjt6U8T6Vc3ZGh8GlH2v9eIrD
	LAcSt+0VImF/K9kRbP/PICN84t9VNits1ys0UUxxLJNK/yv32Jsbpzm218ItSy1fvTfqEIKHwO6cf
	w4m5sU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNXE-00000000aTK-20BN;
	Thu, 15 Oct 2026 15:38:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNXB-00000000aSa-0BAG
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 15:38:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jhtJ3510299
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 15:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3HVvCN3iv+As078Gmff0ARZxT6mIW44MrC4GBBlAmpQ=; b=lYFFnjWRmbFmaK2N
	kmsXfgVyZjgBwQpZ/RGuXDeGxxBhKi4tPvT0Kzml+RkRZeHjmayOcSVGUMHUnZYq
	/+FneWtnTYRAN4ina9gZpBfzdMYhP90Lz9C/FGBsrEM+dlXs7AcyKUYyvf7yei0l
	p0uLs45vpEzeNKDfF77ptvaudR70Y6F0Bwle/gDpBV0U/kqX7kSfzriDh3bPzXnd
	fHs0vNPeMPdCEj8pQ7peCn+Wm8P7l9lEI2tjURqFpyCgT8R4zicdTdpNmmaleJpt
	OnLuigWwHlZmhEYUfCLRhgvdN9LTHg3in150XOSRxLRIBbnWb+4hDBw3zeyA9Fiv
	iaE+JA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdsasqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 15:38:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so7642951b3a.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 08:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792078698; x=1792683498; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3HVvCN3iv+As078Gmff0ARZxT6mIW44MrC4GBBlAmpQ=;
        b=YTzzZF8x1odfjP48x14E51bEz89P29ZWfTde9+ZfCX0YituCHBY3MF0kxb0QO6p02V
         ivfTApaYOL8xYymTIvEpKlXN0YJwEMKS+qwaOyMSZ3bjSMv2RQW4y4uF7jqs2tkJ/94U
         2JJVcvb0lUHZ3U0TAd0tWfCjkwn1ngIMWnRQWFaVEXsnMwgCU7VA/qHpQP5WQAD7Tr68
         wosWXu3m57eXW6pV0S2bpxjpRn97Tt1SKUSJkQNA20stzDYVeAbkBNiUsRMYRhIXGQXm
         J2d7DYvI5Fn0JFaFx+0FyXM++rEXfJ+uO4uLy2ZtosLq7jbO13a1sE1EMzhJXTsC9UBv
         +10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078698; x=1792683498;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3HVvCN3iv+As078Gmff0ARZxT6mIW44MrC4GBBlAmpQ=;
        b=VMkqaa2mepp3mauxotGYXSrENxch8GJIVpHYV8/tEIn55ohnd3Vgk/vONpfQi8qNSv
         DQOOXJBN5/ZfH5T+jOy1rL4kBJq10pwfMGhXEpn/MZZYuWD7ZIuBX5Au4qJT35qCblky
         PAcFmLEuR3buIRB2NFSPoeV91Sk/bK+rZCOhdsXh4GJ6NqX7GXHhUIRPmP8W+AH6ynxA
         dyx72DB9oNho26QbE3mWzz2FXH1KWPqXnDBc1Md0VjgzhebIm1jFY7ThzTag98ec1qdV
         JQhYHI2FS/dAcxSqS7+CW2DX3U8fL221k6ZDZ2W3MsqM14A5OoH+d1A2ig2TD3O+HuAU
         yGrg==
X-Forwarded-Encrypted: i=1; AKwUvBxaQtebSPH8+e0mShNtD58fOheZHbelFEb3anRt1YaYEek0ByS9waqnzzHmb/GH9qdMjwukY6w=@lists.infradead.org
X-Gm-Message-State: AFq9FYJBm/W0KT/fCuyPDCfGn0tc/WZPqvRVjuhIelRfrxSOw/UJCEHF
	E9ehk8Dc8txokb+pXaUcipowSj5BcqZUmPTZhGa+o+ego43dEBkaLA3ZSoDLzWZtpMkQNYnsKJP
	f7vP4EjtQS3tstxZvSnUdF/9SUy3Bxx/XiRqSkEG40DY60dc+4TfQwsXopkqtuEkI
X-Gm-Gg: AYBFou3OUz1zlMmb2GNZSq9euJTgeE1bYUzplqNgRkoQZn7Ku4nCN7NWS6SbgSADu84
	fGNQaYiD1e8Clzbf4ONXs1eKH2JEAl95cOwTtK0bgpBiXhTRFrSBnhXFvcf/DEGYcgD8yQlpuwl
	zD8Q1MxU1ebBwMINsesbUdTvrE3ybMazvUqUEIe02JciX4ZkPN6shKEFFMgRaHl6zup8PK1w/Vz
	0NEmejokCrzhIl8zpqztF3R/90UGfxNc0aR2xM6R6kwdBBWBxKiqxXqoWVjEMs04rXQW4/ZrCRd
	qBn/Z6oJXov/qz5itu+EKAysJzUV5RRNluOEAauXtL5UvOICA7IwXpoujpXm0QVanw6P8wkIlkG
	UX4Dy3vdjE2vZlmp19V90eSYr6x5ZVD+71FAVVyOk0sz049k5Dq0bEU1lMQ==
X-Received: by 2002:a05:6a20:430d:b0:3de:51e1:e7c1 with SMTP id adf61e73a8af0-3e16baa4b77mr18585610637.3.1792078698075;
        Thu, 15 Oct 2026 08:38:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:430d:b0:3de:51e1:e7c1 with SMTP id adf61e73a8af0-3e16baa4b77mr18585589637.3.1792078697463;
        Thu, 15 Oct 2026 08:38:17 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d803cf66fsm2577196b3a.32.2026.10.15.08.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:38:15 -0700 (PDT)
Message-ID: <048365a7-0ce0-4f98-98d2-eb040ff87b39@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 08:38:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ath12k: WCN7850 firmware stops uplink TX on EHT
 (CMD_REMOVE_AGED_FRAMES)
To: Enrico <vovkap97@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>
References: <CAGHkXsZX7Tnze+rqJY=D5Zz2Vo=t2Hee28pDxFpoE+Lno+EcxA@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAGHkXsZX7Tnze+rqJY=D5Zz2Vo=t2Hee28pDxFpoE+Lno+EcxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3M3OfqPZisr50wdUhPa81NDGf4V8QNyR
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0f36b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=4omKq1ZWnG6OjGzzdTAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2MiBTYWx0ZWRfX0kDxM3dA2pUz
 cfJ/ilfawVNSfoh4mezteCTUJics/lk3zN3l2FziZsM6Luk5f7L8MnIKFYK5pmdg188klwoxibz
 xfRnuGRbfo2LkvVeph/x6qlk1yT4bN333rdCPZ2YIF5hVF8Zpdp2TYp5J2JGYqg8ZMCaChJnWqs
 dLBBxfXIFJIpCphimv7h9IHZ2Bty7EqWTzTTKF1zMRZc6G0gaGatMqVa0Z3DXTTts4BEAy5LonU
 ovOAbS9g2IrITu+EoMTLcyF7Bc8agXNtx6VKfP90Uit5/QVR8I3ttqp2KyQRKLFo673hsz+aFOv
 8t8oPv2rBB7C4kBDNwYgE76IV5RBRolEYksyjk5ke8YqTrStXp5P51egDmFYK5qXCQW+wPZzWy6
 MWLbqANneHM7RAX/zN9dFVOJ/Sa5pvYsJuhzgspUjov7Cejp7D8ur+aXRw/xdwZVUoOg6lltnwW
 i31qBwilrngyk8dueGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2MiBTYWx0ZWRfX67LM9xL6TEbC
 +x2t2Oofcd8MIcZpBx/fD6ANRIiZanqlHeyBhvRzPRE58sUQV0UCNxWbn6aMjdC/3m7Yh9CD8iz
 yFggLz3TosCB3uakkOsOD3CeJ46B50w=
X-Proofpoint-GUID: 3M3OfqPZisr50wdUhPa81NDGf4V8QNyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_083821_206096_7729DFDE 
X-CRM114-Status: GOOD (  10.11  )
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

On 10/15/2026 4:59 AM, Enrico wrote:
> Hi,
> 
> On EHT, the WCN7850 firmware stops transmitting uplink data for 1-4
> minutes while the association stays up. The driver keeps handing it
> frames, the firmware releases them as CMD_REMOVE_AGED_FRAMES, and the
> AP receives only the few frames the firmware reports as acked.
> Downlink keeps working and the kernel logs nothing. I saw 11 stalls
> in 57 hours on EHT and 0 in 24 hours after switching the AP's 5 GHz
> radio to 802.11ax.

Please open a ticket per:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html

Then it can be assigned and tracked.

Thanks!
/jeff


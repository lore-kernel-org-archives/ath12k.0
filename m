Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E676CA6017
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 21:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=366Pu8skYlXsy06X6yxAYEU8GUfGajlaG6xyecmuF1E=; b=KsRJFpaDnM5DB3kN+vS4BFPxjh
	rm/K2ko5ZzcdydAnPNJNdTcS+vCuYZI6Q9TPWEBhYhMKc2OpYmvwkwmzQzuz3MmtzE1AfLrYUVQcf
	1waurLHJYjKQkZM83gffGaOAfOAfF2S5eLkcybtEBOj40XWRgP7zOc7IyY+cvl4ES++9pDVumTxvY
	NrN0EBRtS9gvGW+fhIIfRk5KzuwBiBEYXKsyQ64ynH9BHmVQJ3fMqazrVP8PMWS7cjIZfZ6/RZpwY
	M9/q2+xzWWW2dW4vCypwE8JY68wftO9uCijdtC9M0bnBg4IOF8YIO3qNTxIX2nxKUDzE2PXojuT3w
	4ioROUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvLV-000000053kp-1sCy;
	Thu, 08 Oct 2026 21:08:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvLS-000000053kT-39Zm
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 21:08:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L0F1J2534339
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 21:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	366Pu8skYlXsy06X6yxAYEU8GUfGajlaG6xyecmuF1E=; b=QaJfo9i7kzxLPDFp
	jU3cmbBeXuxwHZEeSWWFLLzY3FATHPTkAbDL6YDW/Io20OHVLicLpIiKo3liOlbr
	fwhcf5hJyQbR8roKoVliQZIq4SrRXRZg8pvCNFqIkyipBiS/sYlKW3UwTNcNNeTA
	b4IKzKJBJNJhpAijUvrTFFWbJ3uNQBd3j5frWKuaZRlE5jJDebNupFQNepUkdzBi
	OrwA7UpInSCkEaZvkH09v0bKDPjX5i11F+Jqs2nJQTpRbV273FI9QzbN3AWhkCeg
	VzhvfUuginrR+Z7b7Sa9e15qpCSCEvGQMicosyMxxniR+XPOUobHA3gd7z3ZnTIb
	46h1hA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev58xpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 21:08:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so11622570eec.1
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 14:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791493685; x=1792098485; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=366Pu8skYlXsy06X6yxAYEU8GUfGajlaG6xyecmuF1E=;
        b=dsp6dnhHQcq3GzVbXhUufiVOyhZ4YfSISHJ7wj0xGGGCg9aGe6HIVwgde5EhBe8fE8
         Q9iYxrOogHtJA0Lg8CKwFXsNB1zKxq1Iq+w4cd7aB9Qb8oyP6a7JsUICTIci+PTXCDWh
         d2fYOOqjHvBFPG+fFEcrLa3k7AoI5Cy+uRdYIcAihRE0wQmbVfKB3Kq8WysYYP281NiI
         lrZ5iyFTpmGbXz53kOOC6FCtlhlgnOa24p33FyocNWFP4N/ANBq2EISnPQ1rUK4jDfkg
         hlRfJ1WInjxvuvg90cXMenGTphgqKLvamHv2RMNMuWtXI8LGu3ntJtC9IvLHSlSF2Yxe
         mVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493685; x=1792098485;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=366Pu8skYlXsy06X6yxAYEU8GUfGajlaG6xyecmuF1E=;
        b=zS6Cv7A0gh4iN/h0FiHemY/7ECyrO9ppTCS5Wqj9zD+MxQdtS9CuFWYE18c9oIg2LO
         U9wMYDprMg/XCgx1FMHM/FzxgqeWLw4Uj7RPDIS93bae990MKirwYl/ogFt6aL0BofYB
         BmBlCiv+tb62wYq/vHfr34yWTU+pCiGkKYFRorpJLmdOrCwlfggCvV/N9G4I9PdvGYu6
         cdyHdWoF0OlFvinCNf90fbDQCrMsF5R1oF8mYQVGuWiPmbt7Y1MfH6fCq5vM2yjk3LFa
         PtJC/eldv6hit0f6hGnp553f5auPdJoQQo7kts1ti0wLnG/H7YpYA00IJwlNaK+0k5K1
         tUwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxz5VdbJvloURxxFdGPPHjv+YVfb/zhJsiKQ6Lf4rJEj5Gj2/MfB7QazDC2tyx267t612rKfYU=@lists.infradead.org
X-Gm-Message-State: AFuF++nKZaSvAcEwC30MaEVSrY+W6V9v42jxAqArFXY3fMFuOrtgUdKW
	UExE1Qq0eCcINqcJF3Kal0RouqR09RYSkwugM7LjeqVzz+TYCby5iL0hGRZgAiRDQUWaaLd2wvA
	zZqnJ4gd84m2MhTbRqxbrKNiEHFpUeuTFqB94Eb8KPxFHJt+MAx2Xj1cJHjNCvogv
X-Gm-Gg: AYBFou1JUFjrnuipQeyWsfVcqrTBrnpm6WW2RKc8fEoHwOGzYDO2R9rvya6KnTf1gdR
	u6c2GM0agtavfiUvoiX/gDPF+X+qBfnN6xViHjljdqgRxE3CC/2vDUqQml9y7x/6GUJbnkkUVPN
	HCGNKHGOQGDIwYB7DoPfhb5qcsJJXp2fMzq2scDDItb602GyXl4JQLsHtmcyK00whCuLB6uqC7m
	M72uAWMVUOMp9Cg8fVoWD/E8nD/h9Oizzw/6X6qTA89zJM/UAsWVxki/4xf6pp9zoCMW303kTMH
	/VOGBLDrpt7PAe1B1mCgEJVf7wiIPlCwqrZb/hio1Q0q1rn+5DebqpX+GEDhWABbzOoy0Ov/iD+
	GYw8Hncs7701tZG2CoslkImuPFyXInIjOZrToC6U9gsFH1pP6aQuGiQ9Apg==
X-Received: by 2002:a05:7023:905:b0:166:847c:f162 with SMTP id a92af1059eb24-166847cf1c7mr3573664c88.45.1791493685050;
        Thu, 08 Oct 2026 14:08:05 -0700 (PDT)
X-Received: by 2002:a05:7023:905:b0:166:847c:f162 with SMTP id a92af1059eb24-166847cf1c7mr3573630c88.45.1791493684361;
        Thu, 08 Oct 2026 14:08:04 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1698de65af7sm926202c88.0.2026.10.08.14.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 14:08:02 -0700 (PDT)
Message-ID: <30531489-8d31-4972-a3ea-8a59b154fd71@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:08:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: Make RXDMA buffer ring size
 configurable per memory profile
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
 <20261007-mpp_ws-v1-1-739b1fb87d24@oss.qualcomm.com>
 <cf9dbfc5-5787-4a69-ad04-153afdec1cb4@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cf9dbfc5-5787-4a69-ad04-153afdec1cb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX3E8vIkJ7LPOr
 hfaflwTtJVFT/TR9+tztDnRTBksRaK14fu9wVCdIRfZV3cVZd6PWT9PmZSfDh6VaqtxR3w/Cz9g
 GgsUr58t4iu+akl0HFNiySdiYCu/Kao=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac80636 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LHOLFAxaTfbGgc5nesYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: aQ7N26DeoCcKiogjg8vha2aP5UaewglX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfXwNvJKlFWybXv
 PjpPl7qfXLd37YahMM6EE9iJwOmvzxfVSHJkbFUUMyeyQ4lnW1xj/YIzgPcTo+WDefMxsdfPT8T
 b0+KayYfakYsIsX2La54efXpvRoJzZ6vvqtaejlMI1a6chpBzI9JEeRz6BcQzh7Hgrt4Yys626C
 /q5sTae/D3OwJKvfnVX2s14/jaL3UvccOKtdwuPhLjSB5UrO1CGMM4/Mpv3Y9KL8kX1KNUnNWd3
 zWLfoKwFx0EhLmeGW209ymZ8rubtCZ4OmEydbXgZSbV9Fmu5xbYpfrARDeCs1DYzMSQMZtAMkzC
 2FyN37DLOjY6hps3Ouw3EGiSLw841n0KGvsH8Edd1Wa9knsl5eI0m+mzvkhrwxl0Y209v59vtgN
 4/cL+gz3FdF/xaySNQFuJQTVzVUwKAZ2X8ZqPtPr6z7G0L5/X0U6plTrpYEsvtS9G6ibXh5wAsC
 75vxWnm/vvf+DjGj60w==
X-Proofpoint-ORIG-GUID: aQ7N26DeoCcKiogjg8vha2aP5UaewglX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_140806_804675_A6760C38 
X-CRM114-Status: GOOD (  13.88  )
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

On 10/8/2026 9:23 AM, Rameshkumar Sundaram wrote:
> On 10/7/2026 2:53 PM, Aaradhana Sahu wrote:
>> Currently, the RXDMA buffer ring size is hardcoded to 4096 and shared
>> across all memory profiles. This prevents individual profiles from tuning
>> the ring size based on their memory and performance requirements.
>>
>> Add the RXDMA buffer ring size to the memory profile configuration and
>> implement ath12k_dp_rxdma_buf_ring_size() static inline function to
>> access the configured value. This allows different memory profiles to
>> select an appropriate ring size based on available system resources.
>>
>> The function follows the pattern established in the previous patch for
> 
> Previous patch? Did you forget to add a reference?
> 
> Or maybe we can just say:
> "The function follows the existing pattern of DP ring size helpers, 
> taking struct ..."
> 
> TBH, I'd prefer to drop this paragraph entirely since it's already 
> apparent from the code.

Concur, I'll drop this paragraph when I pull into 'pending'

> 
> 
>> other DP profile parameters, taking struct ath12k_dp_profile_params
>> pointer as argument.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>


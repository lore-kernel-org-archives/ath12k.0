Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883C7CD98ED
	for <ath12k@archiver.kernel.org>; Thu, 18 Jun 2026 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCppw5saOM5VodB6jl5v2xnwLEdEl/ypS18lhiNEjQc=; b=ADTmOYPipXJOZgQrLdrgLhtIa+
	+i+hxoLR50Sx3tKg+o9i/do4lsLqLjx0UY9F758xzzsAQUYBttlc18ubpKPrp9VJP7NvU8cqF/xnO
	QlK8bM1jUykNuwABiiM073C3u+kplGOOtRah7nu3hx/sQkyBjaJ0PCl/5FW+zXBTaKzeITezPiqrO
	HRDui7PcIRXBtbX6zmDCFh2erQ7ffqUD+4SuJawOJ0QzGFiDUyiOLiEi6mk+JEAYEbleZN/xfhzYC
	aM0xbiwD4fyhrPpQdHesKFY+VmmiPoRgP/fBMtsbwsxYoXOgEpR9E3Roqfl6pms8UVm53A89xq12k
	X3j147Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8uK-00000000v9B-1EE7;
	Thu, 18 Jun 2026 09:19:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8uH-00000000v8X-2LHr
	for ath12k@lists.infradead.org;
	Thu, 18 Jun 2026 09:19:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FRST975760
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 09:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCppw5saOM5VodB6jl5v2xnwLEdEl/ypS18lhiNEjQc=; b=K5/9KXSTc7aqcWsx
	LmApMB3soKR1wm/NTVERol101kTx3TD1iVnm7w9ajkCzavFLMKPdl5CqZxE+JYQk
	yDlYjdfKlMZ4DSzwzhZklwHn4vHd3+HDxPd5JdQfsYb2u11x4rlQ3yTMuvEphzXR
	pwpPZMY3ny9Yivxwfl3v68qDvXbjHwmjxj4oyP89N1rnMWbhX60sJVrNncGx7o7y
	Mrg+1DBGnZ1EKeg4ZPijLuB2y4GmFtRMgZcKmeJPZ68V5bG+XxNn247ChJO2Li9j
	YW2E5zBPKlLohnXb+Vt5upJLurowh6ppzgS/ab+i8dTUTR6+7pf6U8WjbFZ0iKGH
	4BTSFQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc2gv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 09:19:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422f987f2eso1104618b3a.3
        for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 02:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781774367; x=1782379167; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BCppw5saOM5VodB6jl5v2xnwLEdEl/ypS18lhiNEjQc=;
        b=RQXQKSn7PnExnX+zJ1hOO8MUgYie3mno+Sqy64tGffHcCcKicIEOtKfY/Qrq22fy74
         nTD/4lJOCGub18t0AGPdABwfowkcB8vXwt7ix/dYB9v9/XL2DxbT51KiKa+X1DKtS+8f
         ONQVjky9798+I0T6fhxu3U//UWUmUX6IdLQ6POFkpiQRJ7/rl+bs2MJHySytzmBVjigE
         EbmRVmtxZTJ2nk2sdeRKq7HBehVkd/86qQbmcCLQbSaRAZnloH2uJ0o1K4Ib6BEraUSe
         wItqgSMm/+eLti8giIQU6mLOwSqIRtYvPi+hmAoCPkf0UCcDvm8S10lNN3afVEs7kJIJ
         Lx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774367; x=1782379167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCppw5saOM5VodB6jl5v2xnwLEdEl/ypS18lhiNEjQc=;
        b=sn5PSodI4c4FO85z71aZ7Szrg6425HcWr+tsjekfQ2jCR7bvbKYv8TFNMz/HYjAIHL
         IIgaHvV9Kzwuc0oLW+ATGZmRiQgYN1CmRm12gyYUskIUVY8N7V5inu1Xj3JtF8+ukHBm
         PINDYXdwCkVN2I+jsfzB1jHSsaClNrJytCp1vGYwbocOtZ7uowtlq8EadGvMTZoCWB4p
         3cZj1t7HNrqzt3zzpSeShsGc/0L+lsiGJX8//H9yijUG2UZrC9fphQlPaMXaNl2L/rLJ
         LLEYiNHXZ0N0KUSP+fQvIcHcf92zp0s5PnUux7jDC9G7GTZbDLmlivLWy2Decn+PUDCm
         LKDA==
X-Gm-Message-State: AOJu0Yw/KSfgxE68ztub5OQL5aRzsB2EY+TUtvSIAyE6o9mwp4vrAjBb
	A577VA67KWMoU74Vg7NPqPx4WQ6gAxuZr6XVChzJ0swwZYUJFRIlNwhO/J0TxA2U8qlwPXXYwQn
	WxOvIDUxxDZLNF+gqQ6X7jPpDtI7etMsyrDzGt+c2QEw/99A9i8qhxK2qemfVT9Am
X-Gm-Gg: Acq92OHeHdLE/8ZjroZ7OnphDytguakVEKtD2vfZHQojaZfAJx+ANXI0IH4HctTj+vd
	5fMrNy/JqdLGwJGstChx2Pj/16DcQfpMYlMQImn8zsBWVcol0C2fRjO3X4oAZ90iodEBh5LQPpi
	txkYypSBIG1xzyjpq1UClnpmPTuWBYGIKjlA+eNHar8TUOZOeYEUAnAewCEfS5QqB6Kxf/skBZD
	9HSI/eewzH9DBp2t3DmFkT3td1+Cc/dIROx06SCgU4JDD8yGLyHxJ/nkXHlgqkP+HFexbqFhZ4n
	vFqD6BaZWg+c34tLNmSud2jo8F1UEbjCeajpH3TfbKLC0/uCt69Jv52NNFL0y5D9sQmC4Ok1WvZ
	kY3+OxpGnaeUnTLA4f1DDN53H6z5fGuDp+irNqhmlZf3JcEESuHsPaBrkVloH1EM8KZY1tgncqj
	1B4tpsJg==
X-Received: by 2002:a05:6a00:3a10:b0:842:5564:2e2a with SMTP id d2e1a72fcca58-8452442f49bmr7847091b3a.6.1781774367159;
        Thu, 18 Jun 2026 02:19:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a10:b0:842:5564:2e2a with SMTP id d2e1a72fcca58-8452442f49bmr7847058b3a.6.1781774366684;
        Thu, 18 Jun 2026 02:19:26 -0700 (PDT)
Received: from [10.133.33.90] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b00d4f5sm18512374b3a.43.2026.06.18.02.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:19:26 -0700 (PDT)
Message-ID: <bbda9e75-b46d-48e6-83b2-761962fcdf2c@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 17:19:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/5] wifi: ath12k: add HAL ops for monitor TLV
 header decode and alignment
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
 <20260509025819.1641630-4-miaoqing.pan@oss.qualcomm.com>
 <aa5e214f-2d9e-4c97-b45f-7181c81cf023@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <aa5e214f-2d9e-4c97-b45f-7181c81cf023@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a33b820 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qWpXrtrtBgBgn8a_gTkA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: JfKhfkLAs7osa2C65QXX4XtYzI8ZfXH6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4NiBTYWx0ZWRfX41LVehhwVEfX
 2IPEu/aXetPFpQbWvSghI7i9Z+aY3tG9aWiDKBdlXQFv+11pLSRsqPD0SF4adBCLJS+JVTSVb6/
 OoifGJno8WmuNcc/9XpRgh2bwe7xk4M=
X-Proofpoint-ORIG-GUID: JfKhfkLAs7osa2C65QXX4XtYzI8ZfXH6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4NiBTYWx0ZWRfX4cX1Gk6zh7u6
 qP+kLWiNL0X50S4ylj65KQiGoz76f9ElcdQXq8GMQLt8GuHzQ6ZBNE8vdvJ2d6TDV+xb3C9YkO9
 QUvVoCzby0p/DRSuscpsf9/lzuxvl11iKe6691x9NeLi7LmpqAksNpobaP7/bjiqCkoCv5oK8D3
 Xv5M7/0H4CYCMRjnH9qNl/G+6tvONTnLGqpT5rWzKTNGxDHT7uEXB5aasFD31lQ0Aj/74fD4bSi
 38zPwn1jSuOp9xZZlh/eu9ojSfaUItUQzoWLUzIQPoSE/bYxVYhxJCS0LyezXLC2KakFgYQdVUC
 jhwgD0hEy/a5ugrL0xa3NrGj523pKTLwwt32obbmqi+MRXpJilEyo/dS407sCyvdMYsiQs8zIXB
 +TbWejlcEW+Wn9xTF4CbmUEO48dxpce8otWRnYL+u/QWMEQtKXWyYrDSJzYELiuaFBLuQdNOsRa
 gIgtNFP2COu8rhK1nDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_021929_715491_E047C5B9 
X-CRM114-Status: UNSURE (   8.54  )
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



On 6/18/2026 5:13 PM, Vasanthakumar Thiagarajan wrote:
> ops get_tlv_hdr_align() seems unused, may be patch 4/5 is supposed to
> used this ops instead of removing the alignment?

Used in patch 4/5:

@@ -2973,39 +2975,38 @@ ath12k_wifi7_dp_mon_parse_rx_dest(struct ath12k_pdev_dp *dp_pdev,
  				  struct sk_buff *skb)
  {
  	struct ath12k *ar = ath12k_pdev_dp_to_ar(dp_pdev);
-	struct hal_tlv_64_hdr *tlv;
+	struct ath12k_hal *hal = &ar->ab->hal;
+	u8 *tlv_value, *tlv = skb->data;
  	struct ath12k_skb_rxcb *rxcb;
  	enum hal_rx_mon_status hal_status;
  	u16 tlv_tag, tlv_len;
-	u8 *ptr = skb->data;
+	u32 tlv_hdr_len;
+
+	tlv_hdr_len = hal->ops->get_tlv_hdr_align();




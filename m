Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FE4EA4FAE
	for <ath12k@archiver.kernel.org>; Mon, 23 Feb 2026 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B33hvBVuiqvJymQjx8XSBmxoEXXvA+DPmyhNbHsTjdQ=; b=wh+fsTvIM7LzCtPol+jgm/dtvv
	E2d/t+6zI4B/8lhN1vvtTqvehIflD4r50TxoTK8ghFlPosMfV0wP0Si/Jjx7inw+/b+Tte0S7EUGP
	mXh5ccQHu7p6i9IPROY3BFhOY2Jg1q+uOVc5HwiVCv7NMKLf9QixdplTYlBPZzn8jWDs47UunZJer
	rdJpm8cpvjdrW2k7YyVviT6KMoC+HAZzIRxT60hMPa8rzIyClYHGRIZ2tBhc+/ipB+D1iml5u/xuj
	qgAZqIfxjr+KcWMzRd8s85XLiVWpKyNCblpTPayx2za+pijOc3uKbnUgYidF2l4df1JpjuCofQqOx
	b8vmvx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUAs-00000000BZj-0Sgl;
	Mon, 23 Feb 2026 11:32:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUAp-00000000BZ1-0nkt
	for ath12k@lists.infradead.org;
	Mon, 23 Feb 2026 11:32:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9Okv72608680
	for <ath12k@lists.infradead.org>; Mon, 23 Feb 2026 11:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B33hvBVuiqvJymQjx8XSBmxoEXXvA+DPmyhNbHsTjdQ=; b=a1qRh330qXEwRULx
	jAiKhLwZV5nxJnWvoxpw3o7KhynMrDYSbCY3ovJBH4oqeTinKcAe8nYBR0xWYqf9
	U8T0m80T2CJAAlA1uXrgXe/Xd3kE3oZIMAmgqe2cZLKymPrSzO+4wYDDsXCEv27z
	0lSjFCnkafFn1JWSVQ+Le7dMgKi2Tfaa2TS7PQlsZCImg59p1DmqvTD9G5QIUbWj
	ShQWK7dy3T/9gBtRWcG56aEucmpWtpnAISPD8BkVIvLlZ7rPbTSfYU2qnTu7JYfE
	kXF9rzpGr6yMEDvj1U82pf7EGkYRLqw39UNyzYSDgURqu3c+6Tu8kKlfKatnjQtd
	0qEWTQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgvkpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Feb 2026 11:32:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6b1b22b134so2626703a12.2
        for <ath12k@lists.infradead.org>; Mon, 23 Feb 2026 03:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771846342; x=1772451142; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B33hvBVuiqvJymQjx8XSBmxoEXXvA+DPmyhNbHsTjdQ=;
        b=LDSwOf8v2hcDzScQmbTyG4Mz5ncyUatr7Gh0jrf3ErpcX0jUr7Knxwmr/Y4anADZpZ
         4xyxVror6ME0VGTz/QBnfm/D2m9HZsRef5wDbvzoR+Hy65Qd9UIxMIVFuaDbI3oYD7Kd
         XShUe3e1lO8DW3AWFCbpsiYvWIXAB/DBJzZ3vm0twmU1R0PX6buoV10mQzZWjsf2BdIw
         JOuX4NyxVtKdAg2RRTx7W3XiQ74H2QC3q0o0BAx6pOObnN+rte5JIb/awI9F/MK7OGe9
         6X77ttNzAougJo/JrE8/1hnkIrRcgW2JTV6hlgphrp0eklPKBK6nDx48QwnP1jov9MTo
         chGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771846342; x=1772451142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B33hvBVuiqvJymQjx8XSBmxoEXXvA+DPmyhNbHsTjdQ=;
        b=s09g2mNUHUXwMwEC8YY/U7T6CJ1MLqkicjqF6Mx6EtiHpidVkV3/52tySXTrlXEAqR
         Rvim+PBoXddxzKfkhSYHmCeJSfwSSRtBd5ysuGlKNckkhWn2pTCJhnuY5Zc6D4P+/HGx
         pE6zvIEZ6S/t7U7s4dboo986Nw61SuO+q0PkUcV4hPP+HI22fLa8Zm0agAKwjKzTri6I
         1E4ZsO53lMa+KiEDiw1Br5bZz4IATm4APjp4cpiSzSvU6pNRRNR8wFsa6AE9EmKOH3uw
         9PbT01gPAz/aOXwI3v9CCIscb/Tix5hD6YoCzcAyjvlFeWLAEQ9D6vqOsh4+9Sd6Yf/o
         Xq5A==
X-Forwarded-Encrypted: i=1; AJvYcCVXJzUas6aFEppzoyV8SZpVqz/JNvAq33OBh9teQORqf+VET2VxMUPJpL915gLdx4qS4o1d1u4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwthZ/WA9pzCpt355R5KexYtrqcxOgxsLkBSlp2ZjyExrtRHtei
	QFZz63OKxRorEhyquLDyVyu3LwVrxuchFNU5u/cQer6ztP11kmaZSsWp2opXO92zb3EC0soKIxu
	KNrkCOtaacIgXOOfASjFurifMg5l9pZUutlfVVyvjcXNZstQcoRQXmpeDrFiTYQWM
X-Gm-Gg: AZuq6aIj434Rw2gUQjn0lL8DDtx7i2odr2orwI6Wzf+y8pz5zYKjXNPZsbXd9QcJ1Oa
	rYE4uN6h1kSX3SYjiyLD7hn5WUQNQwExwixUssBvNS3Dov74fGQMMItBxtyUZfTj+vE1g0MdUPU
	CCuoLkHYhCJ05MHU1sHj2huBs0h9lp983GmhBwAoP0Wn/+LsDNYfk96y3mGOMcNxGbwp3hOSER6
	UTn69P9daGPqi/daqQz7BNBXxieOaiV3tBhxJXEGAOo9gh1TUDLbJtwCRCAqPadUKeDGi0mieIi
	Ge80P4FpMYp3qYrnadj+ojmdnNxSUiaIWn1F8fgJP8vJvEkp1wgYVC4ei1VizUDwRT3zNhnLK9w
	BL3UzPp7o6XjNEJ1K/Ztz0iAuXGE6IsAE89UV/UQCm/GEGvHZIbPCGeuizZObxoOB
X-Received: by 2002:a05:6300:4083:b0:35d:53dc:cb57 with SMTP id adf61e73a8af0-39545f7b037mr6672569637.49.1771846341881;
        Mon, 23 Feb 2026 03:32:21 -0800 (PST)
X-Received: by 2002:a05:6300:4083:b0:35d:53dc:cb57 with SMTP id adf61e73a8af0-39545f7b037mr6672549637.49.1771846341312;
        Mon, 23 Feb 2026 03:32:21 -0800 (PST)
Received: from [10.152.205.141] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b724321esm6997066a12.16.2026.02.23.03.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 03:32:20 -0800 (PST)
Message-ID: <b07328cf-c2cf-4786-ac12-06ea9ae3d266@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 17:02:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: add basic hwmon temperature
 reporting
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
References: <20260223060238.7038-1-maharaja.kennadyrajan@oss.qualcomm.com>
 <DGM9946HTER7.2HAN0CPP3R2ZZ@gmail.com>
Content-Language: en-US
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
In-Reply-To: <DGM9946HTER7.2HAN0CPP3R2ZZ@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5OCBTYWx0ZWRfX4DiDZqRhlCt0
 JiQvPXyeQr2aDWrg6mnLXNu98Mwza2jaoHv0Nwxb7zT37wlz6XM5khWvGZ4kQ8UpCZqcJ6Rt8DE
 7jX7hG6VM7PcHnTb8F7mMRvMqqhi3OWXblGLvq2Yiw/L9RwcIE33Lu29Qr2+kzipZFn8vpYWyoJ
 ENwNcNQr/35WFT7z5J0XPmlrlI8HpdWeK+YcdsIkmvypaGB3yFLMdn3cjqHLOzOodysysnoMGZN
 HZkiolbXnE8JdL425kRnmbCvj+VL1WA9zx9orF4yRQxdXonGLMTXcm3xdKFEpRlVXXIfHeSvetr
 R8i/6P1eq6y6liV5SEdSOugal2Jbm9LbzIRJhTenpb3cG0Z+jz8lKGf26ffTWqqKbVjQdyHhhTw
 LfQYYEP5QmrVWmIS64HpZZiBithFQ9kA10OaOeE1DX8JZzzCaqIWTk/jCdgo2O3uCulexolxznN
 mwbNc85fa61T5MOzSYA==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c3ac6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=xDP2Xacuzhm5-ruWbqoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: FK75K4BG-SBsMmw-PEuD6ov64hY61UsF
X-Proofpoint-ORIG-GUID: FK75K4BG-SBsMmw-PEuD6ov64hY61UsF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_033223_233017_B7E7E88B 
X-CRM114-Status: GOOD (  14.44  )
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


On 2/23/2026 3:35 PM, Nicolas Escande wrote:
> On Mon Feb 23, 2026 at 7:02 AM CET, Maharaja Kennadyrajan wrote:
> [...]
>> +static ssize_t ath12k_thermal_temp_show(struct device *dev,
>> +					struct device_attribute *attr,
>> +					char *buf)
>> +{
>> +	struct ath12k *ar = dev_get_drvdata(dev);
>> +	unsigned long time_left;
>> +	int ret, temperature;
>> +
>> +	guard(wiphy)(ath12k_ar_to_hw(ar)->wiphy);
>> +	guard(mutex)(&ar->thermal.lock);
> Hello,
>
> Is this mutex really needed ? It is used in conjuction with the wiphy_lock but
> it's never used elsewhere. So even though there can be multiple ar for a single
> wiphy, there is no code path that that would lock this ar->thermal.lock without
> locking first the wiphy. And the wiphy lock already protect for reconfiguration
> and recovery right ?


Thanks for the review. ar->thermal.lock is redundant here since the path is already serialized by wiphy_lock .

I’ll drop the extra mutex and its init in the next version.


>
>> +
>> +	if (ar->ah->state != ATH12K_HW_STATE_ON)
>> +		return -ENETDOWN;
>> +
>> +	reinit_completion(&ar->thermal.wmi_sync);
>> +	ret = ath12k_wmi_send_pdev_temperature_cmd(ar);
>> +	if (ret) {
>> +		ath12k_warn(ar->ab, "failed to read temperature %d\n", ret);
>> +		return ret;
>> +	}


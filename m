Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29817606A32C
	for <ath12k@archiver.kernel.org>; Fri, 20 Nov 2026 02:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fjhCe8DS;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVBjjFEX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OrpnErih
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U9yc2VkkPuc/RNg0RZUbGHPvC6vp9oOQHo0RP401KUI=; b=fjhCe8DSecTtVX
	BObjY/V+dz8A6JKqFuHBNDdadUNvbF32qvpfT0G/gao5Pd24XCvO8PxDSsc58eBKt4+I/hlb7usLW
	pGbNELF0tuim+NVuSQec9Lc3lPin2HxCEH+X2B4p1DG2VhpvCedrhdIhqIOEY+gMJo0KYIt8eZC2i
	kWf+2YZYxHyCVFI9FAddLazALWUQq8wwl9+EyRLBK49Cwmj4pNYVR+OGfvoEJGmqiYgJq+JYpwdSV
	GRFg3nCIQiQLIw33J8B5YjU4gdkVwF1cBSRC4flvkfj3vxrItAX3S13zIngTR0QEZ7KHAzUXhar/r
	pXwfU7GBr4SsY8FbWIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUE8V-0000000DsEx-18gO;
	Fri, 20 Nov 2026 02:13:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUE8S-0000000DsEU-18Ne
	for ath12k@lists.infradead.org;
	Fri, 20 Nov 2026 02:13:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GSvV1048768
	for <ath12k@lists.infradead.org>; Fri, 20 Nov 2026 02:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9yc2VkkPuc/RNg0RZUbGHPvC6vp9oOQHo0RP401KUI=; b=MVBjjFEXgtLpmWhH
	sXBbA9lgTsZ/Rnt9bxbCQe2G9xb6DSX9FtTmFMapfQqy91pdtMZBVjliNNr2AAM2
	sV6XHtts4sy5gYUMSfv7bVre2ZLNH37v5jFgqSKsC2YYYQA/eDjKqgZeePMtbRta
	aJCo/ORVZsHc2wr6rG7rDFVmfJP78Ow5Hvu1XjF3vtfLBEKTQselVOHxBDP4ZyEL
	V+5gb47AOea7MnmrGijFPmLAMASJu2xnoQr73APpWaBb6jW8Ah8COzgwRzXYPaBD
	48S08PjMzBrKdwkTqS561EYpSYVededMc0hqwHr+5z0+AECT+Ux0AUq749GZVVZq
	5vXEXw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymm2rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 20 Nov 2026 02:13:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so661520a91.1
        for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 18:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795140834; x=1795745634; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9yc2VkkPuc/RNg0RZUbGHPvC6vp9oOQHo0RP401KUI=;
        b=OrpnErih3itHQcLoVYRpiE1WstRnKierf6dMq+RwVe/nO51/c1PWV++o0EQNRhmXRm
         Jr+XR30Y8+yShGa0qwOLgl1e7X1biR2FwpmM77p+HPI6A8Tu0TqlgVGQuH9rbE65MHX4
         dWrexArS+OpXQZ9IeiAoihitbXFng53GjcxH3wtFhZBV+rldDuT+4FEZgjCUK7LvPbkH
         EvYKj3T37MIIvpmGT68IWETOITTI1yAVM/Jl/q4/7HQGvnFmhPjeI38QGJP+EDBFbWmJ
         mKLuFMWRtpKzonm+0YZ+rs0mSlW6SCdxodsFfZxcgkKneI96qWhbu2CydC6ORUtRmoTd
         SzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795140834; x=1795745634;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9yc2VkkPuc/RNg0RZUbGHPvC6vp9oOQHo0RP401KUI=;
        b=dYb8Tbh4EgC8CRwBuqIlCyWDUAB2GKmppOKH+6YyafL7JNJzVxa/Ajd4YAwAU7lvgf
         8YSPOfkGmKDVeg8K94BiVnRgdxqv+rxhKqXFhzFx0uzlXdRQKeZgCco40P7oXSW869Kx
         wfuD0OVfdl7yqUc6KItofbpGKzJOlQIiyMNb5L4ogys3wOj0EBL0PQEpUjNxEzxIsNWj
         p8evW1Z6f3jTC9mMsnfZmqmLFkuEeJ4M0Ws95039s0mceraJFe7yit1ZDrypmvRNaKKw
         e2X6W0jOg3o7yCyNQkM+DC7xb2dg8rVxxe/J9ahh6IvppqKDnGjGsU1DZ0pmiie7pvvw
         ltag==
X-Forwarded-Encrypted: i=1; AL+hErEqAwgxz5BttB5lsK0jpSquWnmU+osJGVrCDbFtb5rPO6c9MEMHp2lQKn4kgrNyAgyrSGD6BLI=@lists.infradead.org
X-Gm-Message-State: APuU4Z/jm8k/aw0/ZhyRgUkdVGVwEL21rrTLoOhG6K+jjOViVC3nu79V
	THoBTsIrrdK01UAh4qZqdsN/b6bzwiUI1YjgYu7we4/PhDywyo82lO4Z3TSqApjtVSbeqaD8NFX
	aebH7LBoL0g/1GN81gppWv7IVoWkf4zEa6oqBkSzVVdIMt2jM8BHA86IV/tWDubql
X-Gm-Gg: AZFdTZdGHvZcyZtdLQuyAigJPHSbS8JOZIOEAU5abeVvmJklEu+eEHEbNvTFE5U+RWY
	fh125mj83NVY07O1YweZav2sSQF7XjpRweajz6d/eC4Vf8MfiA7eQbZmQIqHe5uWLLme+CBrY1o
	iG3sEc4ujBfQHAFQ0mIw/16RpWAQSxJiEfA7cqoSulok6QoHQ6cubex0Nt2n/IVV+5vmQN7wuAZ
	xHnSUjvcudsmSMNJ9Us4eIrXGY+Sh73ASAuzmXNstSLwf9rCiN3X53V16lT1Es3A7Jd5z6h/Fja
	BSuVE8nss7Rsnar3J7Qmnp1kgJSrmXBS/tKd5GFhGjThXNCilDBl9ozQoJ1l37j5Rasw1KWnUKx
	Fmc4UnVRcWBcQWVqxX0/+U9yJkLeZ4+NSxEsLFUaqqZCsUDJOEQYa5uhKK6yrpe1cvFBhkoK+YR
	BYV7h/ujrVUyWx4eoJQB5zmtG9dQ+kDhuwtReguv9uuwGa
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr1394773a91.9.1795140834207;
        Thu, 19 Nov 2026 18:13:54 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr1394743a91.9.1795140833690;
        Thu, 19 Nov 2026 18:13:53 -0800 (PST)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm893758a91.7.2026.11.19.18.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 18:13:53 -0800 (PST)
Message-ID: <46ad0af4-b719-48c3-b653-7367c5b2a136@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 10:13:50 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v3] wifi: ath12k: parse the nested DBS/SBS
 capability TLV
To: Jonathan Wolf <wolf@pi0.com>, ath12k@lists.infradead.org
Cc: jjohnson@kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119191717.215161-1-wolf@pi0.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261119191717.215161-1-wolf@pi0.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwOCBTYWx0ZWRfX7SIf8eV6tFYE
 +7G1XuBAbyRm772QlLxGywGFChgEH5L07DVWZHO/DxZv1GAeWRfVMsU1shNyP012d/l5C1xgoey
 +++PfDNSbBF0FrvrU7Sq0bJGSuRqV8I=
X-Proofpoint-GUID: Esvr0XDDZWRn02aKfNm3hJJzeqrG1Xl_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwOCBTYWx0ZWRfX34K3kNeWreDH
 jmi/xMkmmzNj41SyfV/sJJ4QGkoe+uBI7uWJ1TLWcFIAxij00o36ClYeiQ2DJJUydQJEI3NS0oE
 0z402zGhV8UNATZpHXuIbvPOr+7hE4n9AbgSlF4AOUqZYMbzv1lphfmEEVIL4XYDhDMOv3PWHWD
 A7avHt8JaEXJwDfXTu2bEcSiS5ZSJU5ISg2v09thZYah52kL33ddMyPptscoeD6lH2G1ZepzOQy
 bIYT3572LkW02zZBbC2kKdhjGkqRYgJ17ONrtswnsEMm/YvRzpGOMHyvaC5qEDMV/Fh4td0i+Zi
 vqUonoxBUWLyc0Q52cxGwU06H2qX01ADPqqYWpKL/fsAO8opvc+zfKs/ZDS9dpQhyTHARqMoP3q
 lHAnz6ydhHFCEPEf4KwaL7ECo21feuSKz06jMKLAwxArinAnTSjcrOT5CJR6SCAym29ByaJ6yAG
 Ygom3Rsj8ib48qvjS2w==
X-Proofpoint-ORIG-GUID: Esvr0XDDZWRn02aKfNm3hJJzeqrG1Xl_
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6afface2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=apydtGMFAAAA:8 a=EUspDBNiAAAA:8 a=ZrLfHWaURdO93HeJtlEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=_GdCGhGMWlTvChih0T78:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_181356_330531_141D30D3 
X-CRM114-Status: GOOD (  11.27  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/20/2026 3:17 AM, Jonathan Wolf wrote:
> The DBS/SBS capability in WMI_SERVICE_READY_EXT2_EVENTID is inside a
> WMI_TAG_ARRAY_STRUCT. The array payload starts with the inner TLV
> header. Casting that pointer to struct ath12k_wmi_dbs_or_sbs_cap_params
> makes ath12k read hw_mode_id as sbs_lower_band_end_freq.
> 
> On WCN7850 with hardware mode 5 and a 5900 MHz cutoff, this gives an
> SBS frequency range of 4900-5 MHz. The driver can then map the 5 GHz
> and 6 GHz links to the same MAC and request deactivation of one link.
> 
> Use ath12k_wmi_tlv_iter() to reach the capability payload. Check the
> tag and minimum payload length before converting the cutoff to CPU byte
> order. Clear the cached cutoff before parsing so an empty array leaves
> it at zero.
> 
> Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
> Signed-off-by: Jonathan Wolf <wolf@pi0.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


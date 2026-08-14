Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D47C5CFC1
	for <ath12k@archiver.kernel.org>; Fri, 14 Aug 2026 18:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZ0ZCO0QYYFyjzNa6YQ0UARU0WyzWWP97iWFolq8hpw=; b=Wn+AGRakcNgxBMdfkC9um35bxw
	WPdd6dXMmmlHs3HO0MlQiLLM1WRjLx6jrfOOJo+GhthLY3dOLbZKYXCsWwm5xIjmzV62cyAUQaWLx
	9E31BvouBM6c60j4+IikG1mvAvEwJZjosAC0yXtTRuj/apmQZdtQI75Z+3qt0DFlh5XnFoEf4UifX
	InO++/X+W71HU3zvEjB+fldQe5mr/UtlU+d9It0xAmT+TEnrdEcB8Tq8uvJFWD2C68b+wW9ufMNIs
	MvWw/CtBB7miXS8Z9Fkydz1uoL4TjRN8Rx2Kl/OHAhTVGU9jD7A/aQLq7yzSW8rdmOwj8tHtiZC3w
	d+HcKeSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwaK-000000032QK-0zsB;
	Fri, 14 Aug 2026 18:24:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwaG-000000032PW-1guf
	for ath12k@lists.infradead.org;
	Fri, 14 Aug 2026 18:24:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EGiCsJ1054749
	for <ath12k@lists.infradead.org>; Fri, 14 Aug 2026 18:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pZ0ZCO0QYYFyjzNa6YQ0UARU0WyzWWP97iWFolq8hpw=; b=Fa4nTT6YnPmll15U
	5DBOPZuSxtntTtoBWedK0wreoq6wE7PyBHouhDKPMu+ijsEby7RJTdn4JsCYjlSG
	uJindpznZvQEHpdXudBRybrhgZd/H8SUv6rXZ+3fXeoSo0U/9T4/MDtxCiVEnEf9
	iVlkHdDC17YUn9XkrB7GTnn8Qrs9ALYtIhbdCx+KZJJNPkyCr64jgEbrEB616wgY
	1NK8T05eghV003WXHfi4hxYwuJMweaqx7n7/rBUawwHJvVUHJiu9/LUMwPK77PEy
	22ZErQgOJyV8kj0+DkrRKkNdbSiJxEdtvFlhNEoCXctAArMlU65m9EO6rZqEmqC6
	R1ABVA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g25ub8nn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 14 Aug 2026 18:24:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so1065014a12.3
        for <ath12k@lists.infradead.org>; Fri, 14 Aug 2026 11:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786731886; x=1787336686; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZ0ZCO0QYYFyjzNa6YQ0UARU0WyzWWP97iWFolq8hpw=;
        b=MfxA0STDWxyxYaK9PsBcIlMGQsmqKfvRFWeePU1ogiOhhH1eFY0LyxwPR8w8ZQAQ5m
         XtXdoYUVtaww2uyyFyzy33A60jmEkHIW7M1FMjKT3/tOs/BXiMBFSutt4ni+R+P7oZMh
         Qf+o1NEfMWdzlyeYbSuEOciwNu68jFtK0legc/PJsroFm2mI/DBEGremYj3c+KGkn5DF
         dU3cp7HgDLCIlpPrYw5R14Se2izE/8v/2zqSY8kq7WNKp9Cz6K3zDq3c0dQtcj/LcKC5
         o7sB3ioMtH0CVtVd53b/ZSw5SfiuUncJcAlCpfFG5ItH2kSZ7KrKYr6/HLEtxC5Knq4z
         2kLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786731886; x=1787336686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZ0ZCO0QYYFyjzNa6YQ0UARU0WyzWWP97iWFolq8hpw=;
        b=ldQIAKcMoo9ZhiA5N8naUSHAsYAEf3hspDxQnVuJWkJdSc5bcHUkgfeeplscNnnzEn
         nMg6s7mbEwrpMiC7ING6im5uwjgX3cJi5mY9dxxRsFZ/+6K6naCJ15nCEWnqnx2huqp1
         4TJjL3Lxy+k3xQce/a/BdgEzqVCFMobHhmQKTGixS0DTprqUVdJacsSAS1vrrUjQQRQS
         JD3jg/rKA2MDM3PGkhoLJJSe7erpKsHcezvGsTgZZHxGp6hXMEqojw4SzMczaM8eoUT+
         wXyN+n8I0nZ6rXBJLdt4LkDkuW2y2pWopMb4XiI5jwrhlG6Q8skbxB56OAG4tNqfB/DU
         j2eg==
X-Forwarded-Encrypted: i=1; AHgh+RoRV63kV6H8YiXroGDxC37+U3NENxYL/2nIi0cTz03mlmXm6G7GGB8s0IIlTB0u9bkl5uiSGbE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk67ra3uy2hm/vQIfQLzryIHseZdQndlpZ5s5QTrWk+XuBpFxW
	gNUFjMA82wx/8QNQsxLO/tUb6gX5kn99e1vTVZNyFlvISGY3L/EY/yTsisEuNuHzxCkcvP+Z4nl
	UySb12EOwNlaEf3nfDkJ5/Q3xh/FelpptszWDhJbmVaGgGkAPwWnLwyvvPQUQUfU+
X-Gm-Gg: AR+sD108PEyK8K7B67ds7KIOcojGUE2IObV2Xf2VhKuRya6eBto3T8fsEVCJI75I1fS
	V4Ct96Ov1AX5lHmeZ4s50r6Jlu8a2DMuSgf4F9BIfIY55L9KF24WZ28R4GuvcLzXCwlj47M7anI
	0s3pGoteUpMwjrEjeqFPVHx2wFJh65lJQC00Kk/u04atN9F3tYz5QdFLgmxC25pS9PF58NN6IHY
	io+a/j3UpjY+dL3EgHcqzp+M85L1Mer06rLHxijvBiH1pYzmvrT1g8ZMu2QwI6rjkgnkUulkR0q
	023Ej+0qDN3sNBbuwx7Uu42Ss7HA+f3G6vTajIVXFgHc2wMfAmQ7R7PiKqYooESZgtN6g3eL+GM
	3A7qDbNzVYs6gPX4t9FiiaNrsgeQC4yOYgx6tUHePCeJX090jzNj68FvpkX3l
X-Received: by 2002:a05:6a21:6e8e:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cc71a89da7mr10359304637.14.1786731886212;
        Fri, 14 Aug 2026 11:24:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8e:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cc71a89da7mr10359254637.14.1786731885722;
        Fri, 14 Aug 2026 11:24:45 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5ff42b7sm7647787eec.7.2026.08.14.11.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 11:24:45 -0700 (PDT)
Message-ID: <30a72dbf-2872-489c-94eb-6d68828ec5e6@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 11:24:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add support to load shared
 firmware on multiPD
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsjiaycA c=1 sm=1 tr=0 ts=6a7f5d6f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=RLFuG0JbbbH53d3NYKIA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE0MSBTYWx0ZWRfXyLp4l8yZs3QG
 p8oiXBNEFj2QNE7tAQAaG21rNlTfCPjXfhNKrYKg0PXeYi2/hHgHaOUQKyESU3I6ypeYp2/wl9U
 uzTMAOzUqFy+F9AWioSvPjePiYd9qpPWQqwpnyOe+lf3Q2Yk27ed+9F9aUoikzrM0vzEqhWiAr9
 BC7TfCRctx4N5cv7Ih8AkNKdKO4sCxD1W3uQC0z7mSLXUHogrcK3gtD0Qz7Ba+BfxsszSac8Oih
 euAE/ypXC0kfnDTlW+sR9XYKRQMGGUhFjv1F217Xz8JTem4hYKt059x3vb5lKalIfdBVEPTnQhE
 3kMr/AVJy5/qCxfnWVZt0BUjaaJPfbep3EMmDoNi2hukU6YDZeza/TREImNVFKBBGHeUWYu+ZPc
 AQLWkOLc3TDGHlKVVGWhNxFEgjKljRfmqmGDoNcD18nInuHxjwlfW19tGdLoi0zwudWgjbk0CZe
 XZKIp5Xrl23gjcCniaA==
X-Proofpoint-GUID: DzgzTEygLWr-1GA41K8y8e66lvR5Bu_H
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE0MSBTYWx0ZWRfX02C3XaNeH7xz
 eUPgizCejOTStKEjV2ZqDH8vF9wqQxCkxLI6kavFYPmZWb2ld/x27v1q6Kn2WrXX3JATIOrAqXQ
 2NcVnyduTxrcjYtRBZGWnX6SPvdCgTc=
X-Proofpoint-ORIG-GUID: DzgzTEygLWr-1GA41K8y8e66lvR5Bu_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_112448_752357_37EC8FB9 
X-CRM114-Status: GOOD (  13.11  )
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

On 8/10/2026 10:43 PM, Aaradhana Sahu wrote:
> +static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
> +					  struct ath12k_ahb_rproc_info *rproc_info,
> +					  const char *fw_name, u32 pasid)
> +{
> +	int ret;
> +
> +	const struct firmware *fw __free(firmware) = NULL;
> +	ret = request_firmware(&fw, fw_name, ab->dev);
> +	if (ret) {
> +		ath12k_err(ab, "failed to request shared firmware %s: %d\n",
> +			   fw_name, ret);
> +		return ret;
> +	}
> +
> +	if (!fw->size) {
> +		ath12k_err(ab, "Invalid firmware size\n");
> +		return -EINVAL;
> +	}
> +
> +	ath12k_dbg(ab, ATH12K_DBG_AHB, "loading firmware %s, size %zd\n", fw_name,
> +		   fw->size);
> +
> +	ret = qcom_mdt_load(ab->dev, fw, fw_name, pasid, rproc_info->mem_region,
> +			    rproc_info->mem_phys, rproc_info->mem_size, NULL);
> +	if (ret) {
> +		ath12k_err(ab, "failed to load RO firmware %s: %d\n", fw_name, ret);
> +		return ret;
> +	}
> +
> +	ret = qcom_pas_auth_and_reset(pasid);
> +	if (ret)
> +		ath12k_err(ab, "failed to authenticate and boot shared firmware: %d\n",
> +			   ret);

my review agent says:
qcom_mdt_load() calls qcom_scm_pas_init_image() and qcom_scm_pas_mem_setup()
internally, which register the PASID with TrustZone. If that succeeds but the
subsequent qcom_pas_auth_and_reset() fails, the PASID remains registered in
SCM with no corresponding shutdown. The caller
(ath12k_ahb_load_shared_firmware()) calls ath12k_ahb_put_fw_load_region() on
this error path, but does not call qcom_pas_shutdown(). On the next probe or
reset cycle, qcom_mdt_load() calls qcom_scm_pas_init_image() again on an
already-registered PASID; SCM returns an error and firmware loading is
permanently broken until a full platform reset.

and it suggest calling qcom_pas_shutdown(pasid)

        ret = qcom_pas_auth_and_reset(pasid);
        if (ret) {
                ath12k_err(...);
                qcom_pas_shutdown(pasid);
        }
        return ret;


> +	return ret;
> +}
> +


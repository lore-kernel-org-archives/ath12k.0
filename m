Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ED3CC6B34
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 06:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrzILkoyvowEBCBs4W94J+1nI3BRb4DDhSmm0sp3WxM=; b=vJg0nbQXyV2YxE8XAQgGMoNOPP
	0egEZakCrpuft4C/bDP9a4KFgzK1D9TEp69pybaKbk6nTqYA84XhOexDcy/gNl0bnL1OJAHSU4tKZ
	+ZKaBpU8WDqv8dn5L+Rvs5Ba7xv3LDNA8ZzCDUR6kUspNIg5pS38Ksz7hxQwJ/vatTUd/SpSZxmlz
	uxoHljcb01SC2uUyaxdeoPbZh/clfZTwegjriFhYyreJzzMLties0svks5B0Dej50Ya8z59OuGuda
	jhBu0FVIj+KW+/5rdsGnqCT7tFV65P9sqTNlg3xhyl85BjBGTwiVu8JBKD2SV+4JPnKGSWZNpQpqF
	zK2HVGaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHExv-0000000Gvlj-2XwF;
	Thu, 15 Oct 2026 06:29:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHExs-0000000GvlC-0mog
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 06:29:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so39420655e9.0
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 23:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792045758; x=1792650558; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CrzILkoyvowEBCBs4W94J+1nI3BRb4DDhSmm0sp3WxM=;
        b=Z8+PQyx3+bJ+PZO4t3qzSsvwGwtz2eR1ZDQotwzAS4BMnXEAH4z2uFid+IOCIaYALJ
         MPsS8ZXNtzls7dBhUQ8hrNERlWEWlCKR7sanm9imbeOHk0OH1eWuvrEGnQqLm0sfhl5N
         X5YbinGI1pq9laT/9gXMWjxRehk9YeOyuIHEg3+DgRgHmDU+tqx8m/aH9sv02UFeHgbP
         +jYCIpOQD0ua977Y0PLENnJAWi4fW/xF88Cr7o/ofidqVyfWTZi3PITS/PfKnm9BqaqE
         ICCWCTq/KovBTOh5PTcpccfs1lULHOC2ExlR+raz3YvcnGpNr5LP+/0kH1oYHpTAIWe7
         s/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792045758; x=1792650558;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrzILkoyvowEBCBs4W94J+1nI3BRb4DDhSmm0sp3WxM=;
        b=eocfHYegLkKT6PSPX/6tl2b21XRVcOC6FXmQt9FVTsMip0JYAE9LnCyHpdTCFJR2PO
         332rPnjJXU/XahxtPeMRAf28uOBEfXEvP5Rw3Pc97PEaaBhDs44gf0izK1ji+bFSoU+F
         xlTruXdoyQ1ALWvTYW/R3GLS0Mcv8HbdNI7ndkz5kXXM88zEdxzDxCeG8N+WNoWc5/yV
         d5d7DcvFcTB/TmKNlIYusxaZXruoon4fT0P5QKqGJlQm+jdE/fL7ICcgjfR24Ztoqw25
         N5dEsAmOo/OOn85LMVzq3LoWwivX7x90MQHj7RHzIRKD57zJdix1YLSLS+1jMKm24JSI
         lefw==
X-Forwarded-Encrypted: i=1; AKwUvBwbB6pxAXjQ/22pjfYeUuBpu9hEI0I9NBrp6RLtc8nF+ooN5hrAvV+4YC6W2TzmF91gJGXsXdc=@lists.infradead.org
X-Gm-Message-State: AFq9FYKfelRZK9Na+VtpPAnJxF9Vcnsnvmun2+jzz2t9dX26O3PDp3cq
	uYc7yVycDHz6rMUiCBfyc37sFcFreaW44CqvH1ueUNsqAfJdhwcK95mKXkbKLZbRH4g=
X-Gm-Gg: AYBFou05R7cLdhjmK3SLkxgpppuFBevFPUrDcrBVg5KXmBxBOtFvbpr5V+RWUBeWgyU
	ToIKWv58WhMxVEndpZvckQaTjdtBWWaXSyofj6c8vFiwc1SQEbCO6oBelT6hGLJyjtMi6obX74+
	T+08jQQbTLN8ohSbSnsv8ZtlbrSn95K/hTcWHxYwFc2BJDzKktXnuEZCV+st4yLlc7G17X2BEQK
	wjvh7GYCGcrDG9rfRQ7vp9HliFVC0UDEFN7bXRLK2oiGJgidBvWhg6c+KHBn9FX+/W833b3TIsA
	kL/oOauJbE5AGpvgVSgETISPFnbvOwFVoI8zD7einwiD3o4ZXsVO69nqv6MNsDF+UXUwhDZ+1Ge
	lcBDwX0BwRlFBgJAZ+OH5DmUXhrvcJH4aA9JLPYytFRpouFcyjWwx0h6PaFHwePAAma1u4jzCJw
	/zT7UbpJxLBByCePhymmfqLUqjKDBf4KMV07EhgySmaBO+igza1lVnaPEnO6enU+uqVzeO/kybI
	bpa
X-Received: by 2002:a05:600c:8518:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a18e4a8ca6mr326220155e9.12.1792045757868;
        Wed, 14 Oct 2026 23:29:17 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1bd9a8a15sm46085045e9.4.2026.10.14.23.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:29:17 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:29:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org
Subject: Re: [PATCH RFC 2/5] nvmem: Add UEFI variable NVMEM provider
Message-ID: <atBwaKE20dJF1jXP@monoceros>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
 <20261014-b4-nvmem-efivar-v1-2-187c85f65018@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zmiuyjupclul4syh"
Content-Disposition: inline
In-Reply-To: <20261014-b4-nvmem-efivar-v1-2-187c85f65018@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_232920_265853_75A40EE6 
X-CRM114-Status: GOOD (  24.92  )
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


--zmiuyjupclul4syh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC 2/5] nvmem: Add UEFI variable NVMEM provider
MIME-Version: 1.0

On Wed, Oct 14, 2026 at 04:02:40PM +0300, Abel Vesa wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/mod_devicetable.h> pulls in a lot of unneeded dependencies and
<linux/platform_device.h> already provides of_device_id. So please drop
the former.

> +static int efivar_nvmem_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const char *name, *guid_str;
> +	struct nvmem_config cfg = {};
> +	struct efivar_nvmem *priv;
> +	struct nvmem_device *nvmem;
> +	efi_char16_t *name16;
> +	efi_guid_t guid;
> +	guid_t g;
> +	unsigned long size;
> +	efi_status_t status;
> +	u32 attr;
> +	int i, len, ret;
> +	void *buf;
> +
> +	/*
> +	 * The EFI variable service may not be a native EFI runtime service;
> +	 * backends such as the Qualcomm uefisecapp driver register the
> +	 * efivars operations asynchronously.  Wait for them.
> +	 */
> +	if (!efivar_is_available())
> +		return -EPROBE_DEFER;
> +
> +	ret = device_property_read_string(dev, "efivar-name", &name);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "missing 'efivar-name'\n");
> +
> +	/* ASCII variable name -> UCS-2 as expected by the EFI service */
> +	len = strlen(name);
> +	name16 = kcalloc(len + 1, sizeof(*name16), GFP_KERNEL);
> +	if (!name16)
> +		return -ENOMEM;
> +	for (i = 0; i < len; i++)
> +		name16[i] = name[i];
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		kfree(name16);
> +		return -ENOMEM;
> +	}
> +
> +	/*
> +	 * The vendor GUID is optional: if it is not provided, look the
> +	 * variable up by name across the whole store.  A variable that has
> +	 * not been provisioned yet is reported as not found and handled
> +	 * below like an erased EEPROM.
> +	 */
> +	if (!device_property_read_string(dev, "efivar-guid", &guid_str)) {
> +		ret = guid_parse(guid_str, &g);
> +		if (ret) {
> +			kfree(name16);
> +			return dev_err_probe(dev, ret, "invalid 'efivar-guid'\n");
> +		}
> +		memcpy(&guid, &g, sizeof(guid));
> +		status = EFI_SUCCESS;
> +	} else {
> +		ret = efivar_nvmem_find_guid(name16, &guid);
> +		if (ret && ret != -ENODEV) {
> +			kfree(name16);
> +			return dev_err_probe(dev, ret,
> +					     "failed to look up variable '%s'\n",
> +					     name);
> +		}
> +		status = ret ? EFI_NOT_FOUND : EFI_SUCCESS;
> +	}
> +
> +	/* First attempt with a modest buffer; grow if the firmware asks. */
> +	size = 512;
> +	buf = kzalloc(size, GFP_KERNEL);
> +	if (!buf) {
> +		kfree(name16);
> +		return -ENOMEM;
> +	}
> +
> +	if (status == EFI_SUCCESS) {
> +		status = efivar_get_variable(name16, &guid, &attr, &size, buf);
> +		if (status == EFI_BUFFER_TOO_SMALL) {
> +			kfree(buf);
> +			buf = kzalloc(size, GFP_KERNEL);
> +			if (!buf) {
> +				kfree(name16);
> +				return -ENOMEM;
> +			}
> +			status = efivar_get_variable(name16, &guid, &attr,
> +						     &size, buf);
> +		}
> +	}
> +	kfree(name16);
> +
> +	if (status == EFI_NOT_FOUND) {
> +		/*
> +		 * Variable not provisioned yet: behave like an erased
> +		 * EEPROM so that consumers still probe and fall back to
> +		 * their defaults.
> +		 */
> +		kfree(buf);
> +		size = efivar_nvmem_cells_extent(dev);
> +		if (!size)
> +			return dev_err_probe(dev, -ENODEV,
> +					     "variable '%s' not found and no cells described\n",
> +					     name);
> +		buf = kzalloc(size, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;
> +		dev_info(dev, "variable '%s' not provisioned, reading as zeroes\n",
> +			 name);
> +	} else if (status != EFI_SUCCESS) {
> +		kfree(buf);
> +		return dev_err_probe(dev, -ENODEV,
> +				     "GetVariable('%s') failed: 0x%lx\n",
> +				     name, status);
> +	} else {
> +		dev_dbg(dev, "variable '%s' attr=0x%x size=%lu\n",
> +			name, attr, size);
> +	}
> +
> +	priv->data = devm_kmemdup(dev, buf, size, GFP_KERNEL);
> +	kfree(buf);
> +	if (!priv->data)
> +		return -ENOMEM;
> +	priv->size = size;
> +
> +	cfg.dev			= dev;
> +	cfg.name		= "efivar";
> +	cfg.id			= NVMEM_DEVID_AUTO;
> +	cfg.owner		= THIS_MODULE;
> +	cfg.type		= NVMEM_TYPE_OTP;
> +	cfg.read_only		= true;
> +	cfg.word_size		= 1;
> +	cfg.stride		= 1;
> +	cfg.size		= priv->size;
> +	cfg.reg_read		= efivar_nvmem_reg_read;
> +	cfg.priv		= priv;
> +	cfg.of_node		= dev->of_node;
> +	cfg.add_legacy_fixed_of_cells = true;

having only nearly all of these aligned is really strange. If you ask
me, don't try to align =, just use a single space before it.

You can write this as:

	cfg = (typeof(cfg)) {
		.dev = dev,
		.name = "efivar",
		...
	};

which is a bit less repetitive and easier for the compiler to optimize.

> +	nvmem = devm_nvmem_register(dev, &cfg);

Does nvmem_register only return success or -ENOMEM? If not, a
dev_err_probe() would be nice here.

> +	return PTR_ERR_OR_ZERO(nvmem);
> +}
> +
> +static const struct of_device_id efivar_nvmem_of_match[] = {
> +	{ .compatible = "nvmem-efivar" },
> +	{}

s/{}/{ }/

> +};
> +MODULE_DEVICE_TABLE(of, efivar_nvmem_of_match);

Best regards
Uwe

--zmiuyjupclul4syh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrQcrgACgkQj4D7WH0S
/k7Hggf/V5sRv/MeY3XE+UjeelKqRfTHz0evXvOJWyrUMTHIBxrDkz8QKuEN9Suk
jeahg8flS8j/DDI1JqZdIFpsddA/zp4pQtQL5VgFe35gJoG3wYXsrVLdWozBylIP
n/evHMBXhRXiCUnQPMB4l3th14mTR5TE1Hb94GtlMKTueC1PPc4L0jzfLBPzEsdT
vnz/amCvOXWaguwBCYf2gy/PYMK/JZtJf0peAj404US7HDDFWiwqI+UdFRK4sTTy
xUgWhdZ+Bj5PLXYavMI1VcPx6G1YPlfflK1GjkMA5/puxk28nPCguUFz9G9zoKwR
7QQYsNrlVCJ9O8W14hihe8LrM7cotQ==
=Qsq8
-----END PGP SIGNATURE-----

--zmiuyjupclul4syh--

